FROM golang:1.15

ENV GORELEASER_VERSION=v0.155.2

RUN apt-get update \
    && apt-get install -y bzr docker.io mercurial rpm \
    && wget -P /tmp https://github.com/goreleaser/goreleaser/releases/download/${GORELEASER_VERSION}/goreleaser_amd64.deb \
    && apt-get install -y /tmp/goreleaser_amd64.deb \
    && rm -f /tmp/goreleaser_amd64.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


ENTRYPOINT ["/entrypoint.sh"]
CMD [ "-h" ]

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
