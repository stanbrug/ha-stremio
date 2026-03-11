ARG BUILD_FROM
FROM $BUILD_FROM

# Install Node.js and dependencies
RUN apk add --no-cache \
    nodejs \
    npm \
    wget \
    ca-certificates

# Download stremio server
RUN mkdir -p /stremio-server && \
    wget -q -O /stremio-server/server.js \
    "https://dl.strem.io/server/v4.20.8/desktop/server.js" || \
    (echo "Failed to download server.js" && exit 1)

# Create data directory
RUN mkdir -p /data/stremio-server

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]
