# frp


[![frp](http://dockeri.co/image/wnwd/frps)](https://hub.docker.com/r/wnwd/frps)
[![frp](http://dockeri.co/image/wnwd/frpc)](https://hub.docker.com/r/wnwd/frpc)

Unofficial docker image packaging for Frp.

Supported architecture:

- [x] amd64
- [x] arm32v6
- [x] arm32v7
- [x] arm64v8

## Usage

### Direct run:
start frps
```bash
docker run -d \
--name frps \
--network host \
--restart=always \
-e CONF_TYPE=yml \
-v ./conf:/etc/frp \
wnwd/frps:latest

# modify your config file (located ./conf/frps.yml / json / toml)

docker restart frps

```

start frpc
```bash
docker run -d \
--name frpc \
--network host \
--restart=always \
-e CONF_TYPE=yml \
-v ./conf:/etc/frp \
wnwd/frpc:latest

# modify your config file (located ./conf/frpc.yml / json / toml)

docker restart frps

```


### Docker compose:
frps:
```yml
# docker-compose.yml
version: '3'
services:
  Frp:
    image: 'wnwd/frps:latest'
    container_name: frps
    restart: unless-stopped
    environment:
      CONF_TYPE: 'yml'
      # CONF_TYPE: 'toml'
      # CONF_TYPE: 'json'
    volumes:
      - ./conf:/etc/frp
    network_mode: 'host'
```

frpc:
```yml
# docker-compose.yml
version: '3'
services:
  Frp:
    image: 'wnwd/frpc:latest'
    container_name: frpc
    restart: unless-stopped
    environment:
      CONF_TYPE: 'yml'
      # CONF_TYPE: 'toml'
      # CONF_TYPE: 'json'
    volumes:
      - ./conf:/etc/frp
    network_mode: 'host'
```

```bash
docker compose up -d
# modify your config file

docker restart frps # frpc

```

## Notice:
Environment variable `CONF_TYPE` was optional, valid values include `yml`, `json` and `toml`, the defaule value was `yml`.


## Update Timezone:
For example: Change timezone to `Asia/Shanghai`
```bash
docker exec -it apk add tzdata \
&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Shanghai/Asia" > /etc/timezone \
&& apk del tzdata
```

## Quick reference

* Where to file issues:[https://github.com/wnwd/frp/issues](https://github.com/wnwd/frp/issues)

* Maintained by:mapxn <https://github.com/mapxn>

## Website
1. [fatedier/frp](https://github.com/fatedier/frp)

## License

[Apache 2.0](https://github.com/wnwd/frp?tab=Apache-2.0-1-ov-file)

Last checked on: 2024 August , current frp version:v0.60.0 .
