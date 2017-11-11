FROM golang:1.9.0-alpine3.6
LABEL MAINTAINER "John Kamenik <jkamenik+docker@gmail.com>"

RUN apk --no-cache add bash dumb-init

ENTRYPOINT ["/usr/bin/dumb-init","--"]
CMD ["/bin/bash"]