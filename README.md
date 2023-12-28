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
docker run \
--name frps \
-d wnwd/frps \
-v ./conf:/etc/frp \
-e CONF_TYPE=yml \
--restart=always \
--network host
```

start frpc
```bash
docker run \
--name frpc \
-d wnwd/frpc \
-v .conf:/etc/frp \
-e CONF_TYPE=yml \
--restart=always \
--network host
```


### Docker compose:
frps:
```yml
# docker-compose.yml
version: '3'
services:
  Frp:
    image: 'wnwd/frps:latest'
    container_name: fprs
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
    container_name: fprc
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
```

## Notice:
Environment variable `CONF_TYPE` was optional, valid values include `yml`, `json` and `toml`, the defaule value was `yml`.


## Quick reference

* Where to file issues:[https://github.com/wnwd/frp/issues](https://github.com/wnwd/frp/issues)

* Maintained by:mapxn <https://github.com/mapxn>

## Website
1. [fatedier/frp](https://github.com/fatedier/frp)

## License

[Apache 2.0](https://github.com/wnwd/frp?tab=Apache-2.0-1-ov-file)

Last checked on: 2024-01-01 10:36:15 , current frp version:v0.53.2 .