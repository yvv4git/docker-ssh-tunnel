# Docker image for pivoting
Create docker image for ssh pivoting


## Start server
To start the server, you can use the command: 
```
make run
```
If you need to change user credentials, you can set them manually:  
```
docker run --rm --name pivote -it -p 2222:22 -e SSH_USER=pivote -e SSH_PASWD=secret -d yvv4docker/pivote-ssh
```


## Check ssh server
```
ssh pivote@localhost -p2222
```



# Pivote tunnel to gke machine
1. **Port forwarding on router.**  
This 192.168.0.103 ip address of local machine. This means that all requests from the public internet on port 443 will be redirected to the local machine.
```
/ip firewall nat add action=dst-nat chain=dstnat disabled=no dst-port=443 in-interface=ether1 protocol=tcp to-addresses=192.168.0.103 to-ports=2222
```

2. **Run docker image in gke virtual machine and enter it.**
```
docker run --rm --name pivote-tunnel -it -p 2222:22 -e SSH_USER=pivote -e SSH_PASWD=secret -d yvv4docker/pivote-ssh
ssh pivote@localhost -p 2222
```

3. **Create tunnel from docker container in gke.**
```
ssh -g -f -N -R 2443:localhost:22 pivote@[public-ip] -p443
```


4. **On local machine.**  
Run container:
```
docker run --rm --name pivote-tunnel -it -p 2222:22 -p 2443:2443 -e SSH_USER=pivote -e SSH_PASWD=secret -d yvv4docker/pivote-ssh
```

Enter to container:
```
ssh pivote@localhost -p 2222
```

Up socks5 proxy:
```
ssh -g -f -N -D 172.17.0.2:2443 pivote@localhost -p2443
```
