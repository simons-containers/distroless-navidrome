FROM archlinux:base-devel-20260308.0.497099 AS builder

ARG NAVIDROME_VERSION

WORKDIR /extract/navidrome
ADD https://github.com/navidrome/navidrome/releases/download/v${NAVIDROME_VERSION}/navidrome_${NAVIDROME_VERSION}_linux_amd64.tar.gz /extract/navidrome/navidrome.tar.gz
RUN tar xf navidrome.tar.gz \
  && chmod a+x navidrome

FROM scratch

COPY ./passwd /etc/passwd
COPY ./shadow /etc/shadow
COPY --from=builder /extract/navidrome/navidrome /bin/navidrome

USER navidrome
WORKDIR /var/lib/navidrome
ENV HOME=/var/lib/navidrome
ENV ND_ENABLEEXTERNALSERVICES=false
ENV ND_ENABLEINSIGHTSCOLLECTOR=false

ENTRYPOINT ["/bin/navidrome"]
CMD ["--address", "0.0.0.0"]

LABEL org.opencontainers.image.title="distroless navidrome"
LABEL org.opencontainers.image.description="distroless navidrome"
LABEL org.opencontainers.image.version="${NAVIDROME_VERSION}"
LABEL org.opencontainers.image.source="https://github.com/simons-containers/distroless-navidrome"
LABEL org.opencontainers.image.volumes.config="/var/lib/navidrome"
