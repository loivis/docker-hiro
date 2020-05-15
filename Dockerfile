# build hiro
FROM golang:latest AS builder

RUN go get -u github.com/peterhellberg/hiro

# final
FROM alpine:latest

RUN apk add --no-cache g++ make python2

RUN wget -q https://github.com/apiaryio/drafter/releases/download/v3.2.7/drafter-v3.2.7.tar.gz && \
    tar zxf drafter-v3.2.7.tar.gz && cd drafter-v3.2.7 && \
    ./configure && make all && make install && \
    cd .. && rm -rf drafter*

RUN apk del make python2

COPY --from=builder /go/bin/hiro /

WORKDIR /docs

ENTRYPOINT ["/hiro"]

CMD [ "-h" ]
