.PHONY: build
build:
	docker build --no-cache -t yvv4docker/pivote-ssh -f Dockerfile .


run:
	docker run --rm --name pivote -it -p 2222:22 -e SSH_USER=pivote -e SSH_PASWD=secret -d yvv4docker/pivote-ssh