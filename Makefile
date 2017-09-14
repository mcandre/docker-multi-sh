PWD=$(shell pwd)

all: test-images

test-images: test-sh test-bash test-zsh test-mksh test-pdksh test-dash test-posh test-ksh93 test-ksh88 test-csh test-tcsh test-ksh test-lksh test-bash3 test-fish test-ash test-rc test-yash test-perl test-python test-ruby test-python3 test-ruby1.9 test-ruby1.8 test-perl6

images: image-sh image-bash image-zsh image-mksh image-pdksh image-dash image-posh image-ksh93 image-ksh88 image-csh image-tcsh image-ksh image-lksh image-bash3 image-fish image-ash image-rc image-yash image-perl image-python image-ruby image-python3 image-ruby1.9 image-ruby1.8 image-perl6

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

image-csh: csh.Dockerfile
	docker build -f csh.Dockerfile -t mcandre/docker-lint-csh .

test-csh: image-csh examples/hello.csh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-csh csh -n /src/examples/hello.csh

image-tcsh: tcsh.Dockerfile
	docker build -f tcsh.Dockerfile -t mcandre/docker-lint-tcsh .

test-tcsh: image-tcsh examples/hello.tcsh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-tcsh tcsh -n /src/examples/hello.tcsh

image-ksh: ksh.Dockerfile
	docker build -f ksh.Dockerfile -t mcandre/docker-lint-ksh .

test-ksh: image-ksh examples/hello.ksh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-ksh ksh -n /src/examples/hello.ksh

image-lksh: lksh.Dockerfile
	docker build -f lksh.Dockerfile -t mcandre/docker-lint-lksh .

test-lksh: image-lksh examples/hello.lksh
	! docker run -v "$(PWD):/src" mcandre/docker-lint-lksh lksh -n /src/examples/hello.lksh

image-bash3: bash3.Dockerfile
	docker build -f bash3.Dockerfile -t mcandre/docker-lint-bash3 .

test-bash3: image-bash3 examples/hello.bash3
	! docker run -v "$(PWD):/src" mcandre/docker-lint-bash3 bash -n /src/examples/hello.bash3

image-fish: fish.Dockerfile
	docker build -f fish.Dockerfile -t mcandre/docker-lint-fish .

test-fish: image-fish examples/hello.fish
	! docker run -v "$(PWD):/src" mcandre/docker-lint-fish fish -n /src/examples/hello.fish

image-ash: ash.Dockerfile
	docker build -f ash.Dockerfile -t mcandre/docker-lint-ash .

test-ash: image-ash examples/hello.ash
	! docker run -v "$(PWD):/src" mcandre/docker-lint-ash ash -n /src/examples/hello.ash

image-rc: rc.Dockerfile
	docker build -f rc.Dockerfile -t mcandre/docker-lint-rc .

test-rc: image-rc examples/hello.rc
	docker run -v "$(PWD):/src" mcandre/docker-lint-rc rc -n /src/examples/hello.rc 2>&1 | grep eof

image-yash: yash.Dockerfile
	docker build -f yash.Dockerfile -t mcandre/docker-lint-yash .

test-yash: image-yash examples/hello.yash
	! docker run -v "$(PWD):/src" mcandre/docker-lint-yash yash -n /src/examples/hello.yash

image-perl: perl.Dockerfile
	docker build -f perl.Dockerfile -t mcandre/docker-lint-perl .

test-perl: image-perl examples/hello.pl
	! docker run -v "$(PWD):/src" mcandre/docker-lint-perl perl -c /src/examples/hello.pl

image-python: python.Dockerfile
	docker build -f python.Dockerfile -t mcandre/docker-lint-python .

test-python: image-python examples/hello.py
	! docker run -v "$(PWD):/src" mcandre/docker-lint-python python -c /src/examples/hello.py

image-ruby: ruby.Dockerfile
	docker build -f ruby.Dockerfile -t mcandre/docker-lint-ruby .

test-ruby: image-ruby examples/hello.rb
	! docker run -v "$(PWD):/src" mcandre/docker-lint-ruby ruby -c /src/examples/hello.rb

image-python3: python3.Dockerfile
	docker build -f python3.Dockerfile -t mcandre/docker-lint-python3 .

test-python3: image-python3 examples/hello.py3
	! docker run -v "$(PWD):/src" mcandre/docker-lint-python3 python3 -m py_compile /src/examples/hello.py3

image-ruby1.9: ruby1.9.Dockerfile
	docker build -f ruby1.9.Dockerfile -t mcandre/docker-lint-ruby1.9 .

test-ruby1.9: image-ruby1.9 examples/hello-1.9.rb
	! docker run -v "$(PWD):/src" mcandre/docker-lint-ruby1.9 ruby -c /src/examples/hello-1.9.rb

image-ruby1.8: ruby1.8.Dockerfile
	docker build -f ruby1.8.Dockerfile -t mcandre/docker-lint-ruby1.8 .

test-ruby1.8: image-ruby1.8 examples/hello-1.8.rb
	! docker run -v "$(PWD):/src" mcandre/docker-lint-ruby1.8 ruby -c /src/examples/hello-1.8.rb

image-perl6: perl6.Dockerfile
	docker build -f perl6.Dockerfile -t mcandre/docker-lint-perl6 .

test-perl6: image-perl6 examples/hello-6.pl
	! docker run -v "$(PWD):/src" mcandre/docker-lint-perl6 perl -c /src/examples/hello-6.pl

publish: publish-sh publish-bash publish-zsh publish-mksh publish-pdksh publish-dash publish-posh publish-ksh93 publish-ksh88 publish-csh publish-tcsh publish-ksh publish-lksh publish-bash3 publish-fish publish-ash publish-rc publish-yash publish-perl publish-python publish-ruby publish-python3 publish-ruby1.9 publish-ruby1.8 publish-perl6

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

publish-csh: image-csh
	docker push mcandre/docker-lint-csh

publish-tcsh: image-tcsh
	docker push mcandre/docker-lint-tcsh

publish-ksh: image-ksh
	docker push mcandre/docker-lint-ksh

publish-lksh: image-lksh
	docker push mcandre/docker-lint-lksh

publish-bash3: image-bash3
	docker push mcandre/docker-lint-bash3

publish-fish: image-fish
	docker push mcandre/docker-lint-fish

publish-ash: image-ash
	docker push mcandre/docker-lint-ash

publish-rc: image-rc
	docker push mcandre/docker-lint-rc

publish-yash: image-yash
	docker push mcandre/docker-lint-yash

publish-perl: image-perl
	docker push mcandre/docker-lint-perl

publish-python: image-python
	docker push mcandre/docker-lint-python

publish-ruby: image-ruby
	docker push mcandre/docker-lint-ruby

publish-python3: image-python3
	docker push mcandre/docker-lint-python3

publish-ruby1.9: image-ruby1.9
	docker push mcandre/docker-lint-ruby1.9

publish-ruby1.8: image-ruby1.8
	docker push mcandre/docker-lint-ruby1.8

publish-perl6: image-perl6
	docker push mcandre/docker-lint-perl6
