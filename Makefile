NAME := blinfoldking/fortissax
TAG := $$( git rev-parse --short HEAD )
IMAGE := ${NAME}\:${TAG}

build:
	@docker build -f ./Dockerfile -t ${IMAGE} .

push:
	@docker push ${IMAGE}

run:
	@docker stop fortissax
	@docker rm fortissax
	@docker run --name fortissax -it -d ${IMAGE}
	@docker exec -it fortissax /bin/bash
