FROM alpine:3.23.4@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11
ARG VERSION=0.112.2

RUN apk add --no-cache jq curl && \
    curl -L https://github.com/nushell/nushell/releases/download/${VERSION}/nu-${VERSION}-x86_64-unknown-linux-musl.tar.gz \
    | tar xzOT <(echo nu-${VERSION}-x86_64-unknown-linux-musl/nu) > /usr/bin/nu && \
    chmod 755 /usr/bin/nu
    

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
