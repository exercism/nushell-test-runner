FROM alpine:3.18

# Install packages required to run the tests
RUN apk add --no-cache jq coreutils curl

# Install nu and move to /usr/local/bin 
RUN curl -L -o nushell.tar.gz "https://github.com/nushell/nushell/releases/download/0.107.0/nu-0.107.0-x86_64-unknown-linux-gnu.tar.gz" && \
    tar xvf nushell.tar.gz && \
    mv nu-0.107.0-x86_64-unknown-linux-gnu/nu /usr/local/bin/nu && \
    chmod +x /usr/local/bin/nu && \
    export PATH=/usr/local/bin:$PATH
# Debug
WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
