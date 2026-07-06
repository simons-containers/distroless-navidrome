FROM cgr.dev/chainguard/curl:latest-dev AS fetch

ARG NAVIDROME_VERSION
ARG NAVIDROME_RELEASE

WORKDIR /extract/navidrome
RUN curl --silent --show-error --location --output navidrome.tar.gz \
  "${NAVIDROME_RELEASE}" \
  && tar xf navidrome.tar.gz \
  && chmod a+x navidrome

FROM scratch

COPY ./passwd /etc/passwd
COPY ./shadow /etc/shadow
COPY --from=fetch /extract/navidrome/navidrome /bin/navidrome

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
