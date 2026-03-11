#!/usr/bin/with-contenv bashio

bashio::log.info "Starting Stremio Server..."

# Read configuration
NO_CORS_ENABLED=$(bashio::config 'no_cors')

export APP_PATH="/data/stremio-server"

if bashio::var.true "${NO_CORS_ENABLED}"; then
    bashio::log.info "CORS is disabled"
    export NO_CORS=1
fi

bashio::log.info "Data directory: ${APP_PATH}"
bashio::log.info "HTTP port: 11470"
bashio::log.info "HTTPS port: 12470"

exec node /stremio-server/server.js
