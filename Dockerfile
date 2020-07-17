FROM alpine:3.11

ARG USER=tor

RUN apk add --no-cache tor

RUN adduser -D -g '' tor

USER tor

RUN mkdir -p "/.tor/"

VOLUME /etc/tor/
VOLUME /var/lib/tor/

EXPOSE 9050 9051 29050 29051

ENTRYPOINT ["tor"]
