#!/usr/bin/with-contenv bashio

VERSION=$(cat VERSION)
BESZEL_AGENT_VERSION=$(cat BESZEL_AGENT_VERSION)
PUBLIC_KEY="$(bashio::config 'public_key')"

# add date to default bashio log timestamp
declare __BASHIO_LOG_TIMESTAMP="%Y-%m-%d %T"

bashio::log.info "Beszel-Agent Home Assistant Add-On $VERSION"
bashio::log.info "Beszel-Agent $BESZEL_AGENT_VERSION"

# Optional HUB_URL
if bashio::config.has_value 'hub_url'; then
    export HUB_URL="$(bashio::config 'hub_url')"
fi

# Optional TOKEN
if bashio::config.has_value 'token'; then
    export TOKEN="$(bashio::config 'token')"
fi

PORT="$(bashio::config 'port')"

# Run agent
PORT="${PORT:-45876}" KEY="$PUBLIC_KEY" ./beszel-agent
