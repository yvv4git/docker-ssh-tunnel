.PHONY: build
build:
	docker build --no-cache -t yvv4docker/pivote-ssh -f Dockerfile .


run:
	docker run --rm --name pivote -it -p 2222:22 -e SSH_USER=pivote -e SSH_PASWD=secret -d yvv4docker/pivote-ssh


docker_repo_push_v1:
	docker tag yvv4docker/pivote-ssh:latest yvv4docker/pivote-ssh:v1.0.1
	docker push yvv4docker/pivote-ssh:v1.0.1
