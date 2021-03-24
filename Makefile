all: install

install:
	@true

build:
	@docker build -t genstackio/build-node .

start:
	@docker run -it --rm genstackio/build-node || true