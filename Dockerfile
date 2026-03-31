FROM alpine:3.22

RUN apk add --no-cache jq curl && \
    curl -Lo nu.tgz https://github.com/nushell/nushell/releases/download/0.111.0/nu-0.111.0-x86_64-unknown-linux-musl.tar.gz && \
    gunzip nu.tgz && \
    tar xvf nu.tar  && \
    mv nu-0.111.0-x86_64-unknown-linux-musl/nu /usr/bin 
    

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
