FROM library/debian:wheezy
RUN apt-get update && \
    apt-get install -y ruby
