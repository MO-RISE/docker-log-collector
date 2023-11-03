# docker-log-collector
Very simple log collector for docker containers


```yaml
version: '3'
services:

  collector:
    image: ghcr.io/mo-rise/docker-log-collector:0.1.0
    restart: always
    command:
      [
        "/logs",
        "<container-name-1>",
        "<container-name-2>",
        "<container-name-3>"
      ]
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./logs:/logs

```