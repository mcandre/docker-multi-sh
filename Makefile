PWD=$(shell pwd)

all: test-images

test-images: test-sh test-bash test-zsh test-mksh test-pdksh test-dash

images: image-sh image-bash image-zsh image-mksh image-pdksh image-dash

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

image-mksh: mksh.Dockerfile
	docker build -f mksh.Dockerfile -t mcandre/docker-lint-mksh .

test-mksh: image-mksh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-mksh mksh -n /src/examples/hello.mksh

image-pdksh: pdksh.Dockerfile
	docker build -f pdksh.Dockerfile -t mcandre/docker-lint-pdksh .

test-pdksh: image-pdksh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-pdksh pdksh -n /src/examples/hello.pdksh

image-dash: dash.Dockerfile
	docker build -f dash.Dockerfile -t mcandre/docker-lint-dash .

test-dash: image-dash
	! docker run -v "$(PWD):/src" mcandre/docker-lint-dash dash -n /src/examples/hello.dash

publish: publish-sh publish-bash publish-zsh publish-mksh publish-pdksh publish-dash

publish-sh: image-sh
	docker push mcandre/docker-lint-sh

publish-bash: image-bash
	docker push mcandre/docker-lint-bash

publish-zsh: image-zsh
	docker push mcandre/docker-lint-zsh

publish-mksh: image-mksh
	docker push mcandre/docker-lint-mksh

publish-pdksh: image-pdksh
	docker push mcandre/docker-lint-pdksh

publish-dash: image-dash
	docker push mcandre/docker-lint-dash
