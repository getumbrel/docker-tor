FROM alpine:3.11

RUN apk add --no-cache tor

# Create new tor user with GID and UID = 1000
RUN adduser --disabled-password \
            --gecos "" \
            "tor"

USER tor

RUN mkdir -p "/.tor/"

VOLUME /etc/tor/
VOLUME /var/lib/tor/

EXPOSE 9050 9051 29050 29051

ENTRYPOINT ["tor"]
