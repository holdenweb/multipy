
.PHONY: build release

build:
	docker build --tag multipy:latest --progress plain .

buildx:
	docker login
	docker buildx build --platform linux/amd64,linux/arm64 --tag holdenweb/multipy:${release}  --push .
release:
	docker tag multipy:latest holdenweb/multipy:latest
	docker tag multipy:latest holdenweb/multipy:${release}
	docker push holdenweb/multipy:latest
	docker push holdenweb/multipy:${release}

