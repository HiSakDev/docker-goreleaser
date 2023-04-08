FROM golang:1.18

ENV GORELEASER_VERSION=1.16.2

RUN apt-get update \
    && apt-get install -y bzr docker.io mercurial rpm \
    && wget -P /tmp https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/goreleaser_${GORELEASER_VERSION}_amd64.deb \
    && dpkg -i /tmp/goreleaser_${GORELEASER_VERSION}_amd64.deb \
    && apt-get install -y -f \
    && rm -f /tmp/goreleaser_${GORELEASER_VERSION}_amd64.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


ENTRYPOINT ["/entrypoint.sh"]
CMD [ "-h" ]

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
