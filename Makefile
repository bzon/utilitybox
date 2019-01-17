build:
	docker build -t quay.io/bzon/utilitybox:latest .

run:
	docker run --rm -it quay.io/bzon/utilitybox:latest

test: build run

