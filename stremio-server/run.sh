#!/bin/sh

echo "Starting Stremio Server..."

export APP_PATH="/data/stremio-server"

# Read options.json for configuration
OPTIONS_FILE="/data/options.json"
if [ -f "$OPTIONS_FILE" ]; then
    NO_CORS=$(cat "$OPTIONS_FILE" | grep -o '"no_cors":[^,}]*' | cut -d: -f2 | tr -d ' ')
    if [ "$NO_CORS" = "true" ]; then
        echo "CORS is disabled"
        export NO_CORS=1
    fi
fi

echo "Data directory: ${APP_PATH}"
echo "HTTP port: 11470"
echo "HTTPS port: 12470"

exec node /stremio-server/server.js
