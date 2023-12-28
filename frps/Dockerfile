FROM --platform=$TARGETPLATFORM alpine:3

LABEL maintainer="wnwd"
LABEL org.opencontainers.image.source https://github.com/wnwd/frp

ARG TARGETPLATFORM
ARG FRP_VERSION

WORKDIR /app

COPY . .

RUN echo "[info] TARGETPLATFORM: $TARGETPLATFORM, FRP_VERSION: $FRP_VERSION" \
    &&  case ${TARGETPLATFORM} in linux/amd64) FRP_PLATFORM=amd64 ;; linux/arm64) FRP_PLATFORM=arm64 ;; linux/arm/v6|linux/arm/v7) FRP_PLATFORM=arm ;; esac \
    &&  wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_${FRP_PLATFORM}.tar.gz \
    &&  tar zxvf frp_${FRP_VERSION}_linux_${FRP_PLATFORM}.tar.gz  \
    &&  cp frp_${FRP_VERSION}_linux_${FRP_PLATFORM}/frps /usr/bin/ \
    &&  mkdir -p /etc/frp \
    &&  rm frp_${FRP_VERSION}_linux_${FRP_PLATFORM}.tar.gz \
    &&  rm -rf frp_${FRP_VERSION}_linux_${FRP_PLATFORM}/ \
    &&  chmod u+x docker-entrypoint.sh \
    &&  mv docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]