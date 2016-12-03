# FROM alpine:latest
FROM nginx:1.11.6-alpine
MAINTAINER John Kamenik

ENV HUGO_VERSION=0.15

EXPOSE 80

RUN apk add --update wget ca-certificates && \
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux_amd64.tar.gz && \
  tar xzf hugo_${HUGO_VERSION}_linux_amd64.tar.gz && \
  rm -r hugo_${HUGO_VERSION}_linux_amd64.tar.gz && \
  mv hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/bin/hugo && \
  rm -r hugo_${HUGO_VERSION}_linux_amd64 && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*

COPY ./entrypoint.sh /entrypoint.sh


VOLUME /src

WORKDIR /src
ENTRYPOINT ["/entrypoint.sh"]
