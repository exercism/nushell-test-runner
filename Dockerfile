FROM alpine:3.18

# Install packages required to run the tests
RUN apk add --no-cache jq coreutils curl

RUN curl -L -o nushell.tar.gz "https://github.com/nushell/nushell/releases/download/0.107.0/nu-0.107.0-x86_64-unknown-linux-gnu.tar.gz" && \
    tar xz -C /usr/local/bin --strip-components=1 nu-0.107.0-x86_64-unknown-linux-gnu/nu

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
