FROM debian:trixie-slim@sha256:62bd423aeee912639ca8ee681c2b762cb3e25137e0a92b20be455898a9f034ad
ARG TARGETARCH
LABEL org.opencontainers.image.source="https://github.com/streamx-labs/streamx-dvr-dist"
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd --gid 1000 streamx-dvr \
    && useradd --uid 1000 --gid 1000 --no-create-home --shell /usr/sbin/nologin streamx-dvr \
    && mkdir /data /recordings \
    && chown 1000:1000 /data /recordings
COPY docker/streamx-dvr-${TARGETARCH} /usr/local/bin/streamx-dvr
ENV DATA_DIR=/data RECORDINGS_DIR=/recordings STREAMX_DVR_CONTAINER=1
VOLUME ["/data", "/recordings"]
EXPOSE 8181
USER streamx-dvr
ENTRYPOINT ["/usr/local/bin/streamx-dvr"]
