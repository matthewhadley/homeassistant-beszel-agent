#!/usr/bin/with-contenv bashio

VERSION=$(cat VERSION)
BESZEL_AGENT_VERSION=$(cat BESZEL_AGENT_VERSION)
PUBLIC_KEY="$(bashio::config 'public_key')"

# add date to default bashio log timestamp
declare __BASHIO_LOG_TIMESTAMP="%Y-%m-%d %T"

bashio::log.info "Beszel-Agent Home Assistant Add-On $VERSION"
bashio::log.info "Beszel-Agent $BESZEL_AGENT_VERSION"

PORT=45876 KEY="$PUBLIC_KEY" ./beszel-agent
