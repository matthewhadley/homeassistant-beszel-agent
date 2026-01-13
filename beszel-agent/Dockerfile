ARG BUILD_FROM
FROM $BUILD_FROM

COPY config.yaml /
RUN grep version < config.yaml | grep -oe '[0-9\.]*' > BESZEL_AGENT_VERSION && rm config.yaml

COPY run.sh /
RUN chmod a+x /run.sh

WORKDIR /
RUN curl -sL "https://github.com/henrygd/beszel/releases/download/$(cat /BESZEL_AGENT_VERSION)/beszel-agent_$(uname -s)_$(uname -m | sed 's/x86_64/amd64/' | sed 's/aarch64/arm64/').tar.gz" | tar -xz -O beszel-agent | tee ./beszel-agent >/dev/null && chmod +x beszel-agent

CMD [ "/run.sh" ]
