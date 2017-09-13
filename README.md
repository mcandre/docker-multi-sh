# docker-multi-sh: Docker images for a variety of shell languages

# EXAMPLES

```console
$ docker run -v "$(pwd):/src" mcandre/docker-lint-sh sh -n /src/examples/hello.sh
/src/examples/hello.sh: line 2: syntax error: unterminated quoted string

$ echo "$?"
2
```

# ABOUT

docker-multi-sh represents a collection of Docker images for various and sundry shell languages, e.g. for easy access to some obscure languages for linting purposes. Many shells offer a `-n` flag for syntax checks, though installing these languages may not be so easy. Even worse, `sh -n <script>` may present a false negtive exit status when executed directly on your particular host operating system, as `sh` is usually symlinked to a superset of POSIX sh, such as bash (most Linux distributions), dash (Debian derivatives), ksh (OpenBSD, Solaris), ash (MINIX), and so on. The most reliable way to perform such checks is to execute `sh -n` in an environment known to use a bare bones POSIX sh, such as Alpine Linux, busybox, or similar embedded system.
