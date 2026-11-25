# ParrotOS Core with a password-protected terminal in the browser (ttyd).
FROM parrotsec/core:7.4

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install -y --no-install-recommends ttyd tini ca-certificates curl wget git nano python3 \
 && rm -rf /var/lib/apt/lists/*

COPY --chmod=755 railway-start.sh /usr/local/bin/railway-start.sh

WORKDIR /work
EXPOSE 7681
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/local/bin/railway-start.sh"]
