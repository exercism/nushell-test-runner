FROM alpine:3.23.5@sha256:fd791d74b68913cbb027c6546007b3f0d3bc45125f797758156952bc2d6daf40
ARG VERSION=0.112.2

RUN apk add --no-cache jq curl && \
    curl -L https://github.com/nushell/nushell/releases/download/${VERSION}/nu-${VERSION}-x86_64-unknown-linux-musl.tar.gz \
    | tar xzOT <(echo nu-${VERSION}-x86_64-unknown-linux-musl/nu) > /usr/bin/nu && \
    chmod 755 /usr/bin/nu
    

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
