APP_NAME := pong
VERSION := $(shell cat VERSION)
SHORT_SHA := $(shell git rev-parse --short HEAD)
IMAGE_TAG := $(VERSION)-$(SHORT_SHA)
DOCKERHUB_USER := daoquocquyen
DOCKERHUB_IMAGE := $(DOCKERHUB_USER)/$(APP_NAME):$(IMAGE_TAG)

.PHONY: build push

build:
	docker build -t $(APP_NAME):$(IMAGE_TAG) .

push: build
	docker tag $(APP_NAME):$(IMAGE_TAG) $(DOCKERHUB_IMAGE)
	docker push $(DOCKERHUB_IMAGE)
