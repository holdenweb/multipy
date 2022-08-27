
.PHONY: build release

build:
	docker build --tag multipy:latest --progress plain .

buildx:
	docker buildx build --platform linux/amd64,linux/arm64 --tag multipy:latest .
release:
	docker tag multipy:latest holdenweb/multipy:latest
	docker tag multipy:latest holdenweb/multipy:${release}
	docker push holdenweb/multipy:latest
	docker push holdenweb/multipy:${release}

