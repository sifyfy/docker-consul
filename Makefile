.PHONY: image
image: Dockerfile
	docker build -t siphilia/consul:latest .
