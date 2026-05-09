# osiota Docker Image

This repository contains the Dockerfile for building and distributing the [osiota](https://github.com/osiota/osiota) container image.

Overview of the image: [Container Image (GHCR)](https://github.com/osiota/osiota/pkgs/container/osiota)

## About osiota

**osiota** (Operating System for Internet of Things Applications) is a platform for running distributed IoT applications written in JavaScript.

For more information, visit the [osiota repository](https://github.com/osiota/osiota).

## Run osiota using docker

Use docker-compose. See [docker-compose.yml](./docker-compose.yml).

Put your osiota config to `./config/osiota.json`

And run:

```bash
docker-compose -f docker-compose.yml up -d
```

## License

This software is released under the MIT license.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
