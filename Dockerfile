# ParrotOS Core with a password-protected terminal in the browser (ttyd).
FROM parrotsec/core:7.4

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install -y --no-install-recommends tini ca-certificates curl wget git nano python3 \
 && rm -rf /var/lib/apt/lists/*

# ttyd is not packaged for ParrotOS, so use the official release binary.
ARG TTYD_VERSION=1.7.7
RUN curl -fsSL -o /usr/local/bin/ttyd \
      "https://github.com/tsl0922/ttyd/releases/download/${TTYD_VERSION}/ttyd.x86_64" \
 && chmod +x /usr/local/bin/ttyd

COPY --chmod=755 railway-start.sh /usr/local/bin/railway-start.sh

WORKDIR /work
EXPOSE 7681
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/local/bin/railway-start.sh"]
