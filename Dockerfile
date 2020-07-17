FROM alpine:3.11

ARG USER=tor
ARG UID=1000
ARG GID=1000

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --no-create-home \
    --uid "$UID" \
    --gid "$GID" \
    "$USER"


USER tor

RUN apk add --no-cache tor

RUN mkdir -p "/.tor/"

VOLUME /etc/tor/
VOLUME /var/lib/tor/

EXPOSE 9050 9051 29050 29051

ENTRYPOINT ["tor"]
