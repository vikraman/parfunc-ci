DOCKER ?= docker
FQDN ?= parfunc-ci.soic.indiana.edu
IMAGE ?= parfunc-ci
TAG = $(shell (git rev-parse --short HEAD || echo latest) 2>/dev/null)
PORT ?= 8080

all: build

build: Dockerfile
	$(DOCKER) build -t $(IMAGE):$(TAG) .
	$(DOCKER) tag $(IMAGE):$(TAG) $(IMAGE):latest

run: build
	$(DOCKER) run -it --rm --name $(FQDN) -p 8080:$(PORT) $(IMAGE):$(TAG)

clean:
	$(DOCKER) rmi $(IMAGE):$(TAG)

distclean:
	$(DOCKER) rmi -f $(IMAGE)

.PHONY: clean distclean run
