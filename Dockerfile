FROM golang:1.15.5

MAINTAINER mark.hsieh "mark.hsieh@hwaotech.com"
WORKDIR /www

RUN mkdir -p /www/conf
RUN mkdir -p /www/resources

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y bash
RUN apt-get install -y iputils-ping
RUN apt-get install -y net-tools
RUN apt-get install -y procps
RUN apt-get install -y tofrodos

RUN mkdir -p /opt/go_process
WORKDIR /go/bin

COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh
EXPOSE 80

CMD [ "/bin/bash", "/opt/entrypoint.sh" ]
