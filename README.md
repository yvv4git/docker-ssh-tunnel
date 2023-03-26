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

