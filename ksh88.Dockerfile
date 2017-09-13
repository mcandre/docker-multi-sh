FROM library/debian:jessie
RUN apt-get update && \
    apt-get install -y pdksh && \
    ln -s /bin/pdksh /bin/ksh88
