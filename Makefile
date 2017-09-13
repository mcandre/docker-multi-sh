PWD=$(shell pwd)

all: test-images

test-images: test-sh test-bash test-zsh test-mksh test-pdksh test-dash test-posh test-ksh93 test-ksh88

images: image-sh image-bash image-zsh image-mksh image-pdksh image-dash image-posh image-ksh93 image-ksh88

image-sh: sh.Dockerfile
	docker build -f sh.Dockerfile -t mcandre/docker-lint-sh .

test-sh: image-sh examples/hello.sh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-sh sh -n /src/examples/hello.sh

image-bash: bash.Dockerfile
	docker build -f bash.Dockerfile -t mcandre/docker-lint-bash .

test-bash: image-bash examples/hello.bash
	! docker run -v "$(PWD):/src" mcandre/docker-lint-bash bash -n /src/examples/hello.bash

image-zsh: zsh.Dockerfile
	docker build -f zsh.Dockerfile -t mcandre/docker-lint-zsh .

test-zsh: image-zsh examples/hello.zsh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-zsh zsh -n /src/examples/hello.zsh

image-mksh: mksh.Dockerfile
	docker build -f mksh.Dockerfile -t mcandre/docker-lint-mksh .

test-mksh: image-mksh examples/hello.mksh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-mksh mksh -n /src/examples/hello.mksh

image-pdksh: pdksh.Dockerfile
	docker build -f pdksh.Dockerfile -t mcandre/docker-lint-pdksh .

test-pdksh: image-pdksh examples/hello.pdksh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-pdksh pdksh -n /src/examples/hello.pdksh

image-dash: dash.Dockerfile
	docker build -f dash.Dockerfile -t mcandre/docker-lint-dash .

test-dash: image-dash examples/hello.dash
	! docker run -v "$(PWD):/src" mcandre/docker-lint-dash dash -n /src/examples/hello.dash

image-posh: posh.Dockerfile
	docker build -f posh.Dockerfile -t mcandre/docker-lint-posh .

test-posh: image-posh examples/hello.dash
	! docker run -v "$(PWD):/src" mcandre/docker-lint-posh posh -n /src/examples/hello.posh

image-ksh93: ksh93.Dockerfile
	docker build -f ksh93.Dockerfile -t mcandre/docker-lint-ksh93 .

test-ksh93: image-ksh93 examples/hello.ksh93
	! docker run -v "$(PWD):/src" mcandre/docker-lint-ksh93 ksh93 -n /src/examples/hello.ksh93

image-ksh88: ksh88.Dockerfile
	docker build -f ksh88.Dockerfile -t mcandre/docker-lint-ksh88 .

test-ksh88: image-ksh88 examples/hello.ksh88
	! docker run -v "$(PWD):/src" mcandre/docker-lint-ksh88 ksh88 -n /src/examples/hello.ksh88

publish: publish-sh publish-bash publish-zsh publish-mksh publish-pdksh publish-dash publish-posh publish-ksh93 publish-ksh88

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

publish-posh: image-posh
	docker push mcandre/docker-lint-posh

publish-ksh93: image-ksh93
	docker push mcandre/docker-lint-ksh93

publish-ksh88: image-ksh88
	docker push mcandre/docker-lint-ksh88
