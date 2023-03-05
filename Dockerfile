FROM alpine:3

LABEL maintainer="yko@swokiz.com"

ARG TRIVY_VERSION
ARG TRIVY_ARCH

RUN apk update && \
  apk add git docker \
    ca-certificates && \
  rm -rf /var/cache/apk/*

RUN wget -qO- "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_${TRIVY_ARCH}.tar.gz" | \
    tar -xz -C /usr/local/bin/
