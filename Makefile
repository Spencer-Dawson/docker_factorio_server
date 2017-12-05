PARENT = $(shell basename ${CURDIR})

.PHONY: download tag-latest publish build

build:
	docker build . -t local_factorio
download:
	curl -L https://www.factorio.com/get-download/${VERSION}/headless/linux64 -o ./factorio_headless_x64.tar.xz
	sha1sum ./factorio_headless_x64.tar.xz
tag-latest:
	docker tag ${ID} spec4d/factorio:latest
publish:
	docker push spec4d/factorio:latest
