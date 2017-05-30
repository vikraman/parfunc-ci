DOCKER ?= docker
IMAGE ?= parfunc-ci
TAG = $(shell (git rev-parse --short HEAD || echo latest) 2>/dev/null)

all: build

build: Dockerfile
	$(DOCKER) build -t $(IMAGE):$(TAG) .

clean:
	$(DOCKER) rmi $(IMAGE):$(TAG)

distclean:
	$(DOCKER) rmi -f $(IMAGE)

.PHONY: clean distclean
