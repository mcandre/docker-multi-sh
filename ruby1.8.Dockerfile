FROM mcandre/docker-debian:lenny
RUN apt-get update && \
    apt-get install -y ruby
