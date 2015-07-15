FROM debian:jessie

# https://github.com/docker/docker/blob/master/project/PACKAGERS.md#runtime-dependencies
RUN apt-get update && apt-get install -y \
		curl \
		ca-certificates \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.7.1
ENV DOCKER_SHA256 4d535a62882f2123fb9545a5d140a6a2ccc7bfc7a3c0ec5361d33e498e4876d5

RUN curl -fL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-$DOCKER_VERSION" -o /usr/local/bin/docker \
	&& echo "${DOCKER_SHA256}  /usr/local/bin/docker" | sha256sum -c - \
	&& chmod +x /usr/local/bin/docker