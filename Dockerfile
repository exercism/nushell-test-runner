FROM alpine:3.24.2@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6
ARG VERSION=0.114.1

RUN apk add --no-cache jq curl && \
    curl -L https://github.com/nushell/nushell/releases/download/${VERSION}/nu-${VERSION}-x86_64-unknown-linux-musl.tar.gz \
    | tar xzOT <(echo nu-${VERSION}-x86_64-unknown-linux-musl/nu) > /usr/bin/nu && \
    chmod 755 /usr/bin/nu
    

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
