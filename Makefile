PWD=$(shell pwd)

all: test-images

test-images: test-sh test-bash test-zsh

images: image-sh image-bash image-zsh

image-sh: sh.Dockerfile
	docker build -f sh.Dockerfile -t mcandre/docker-lint-sh .

test-sh: image-sh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-sh sh -n /src/examples/hello.sh

image-bash: bash.Dockerfile
	docker build -f bash.Dockerfile -t mcandre/docker-lint-bash .

test-bash: image-bash
	! docker run -v "$(PWD):/src" mcandre/docker-lint-bash bash -n /src/examples/hello.bash

image-zsh: zsh.Dockerfile
	docker build -f zsh.Dockerfile -t mcandre/docker-lint-zsh .

test-zsh: image-zsh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-zsh zsh -n /src/examples/hello.zsh

publish: publish-sh publish-bash publish-zsh

publish-sh: image-sh
	docker push mcandre/docker-lint-sh

publish-bash: image-bash
	docker push mcandre/docker-lint-bash

publish-zsh: image-zsh
	docker push mcandre/docker-lint-zsh
