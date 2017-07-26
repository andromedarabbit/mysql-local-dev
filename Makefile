TAG=latest
BIN=mysql-local-dev
IMAGE=andromedarabbit/$(BIN)

build: 
	docker build -t $(IMAGE):$(TAG) .

deploy: image
	docker push $(IMAGE):$(TAG)


