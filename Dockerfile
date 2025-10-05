FROM alpine:3.22

RUN apk add --no-cache jq nushell

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
