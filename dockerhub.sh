#!/bin/bash

CONTAINER_VERSION="0.7"

docker build . -t quallenbezwinger/portfolio-performance:$CONTAINER_VERSION
docker build . -t quallenbezwinger/portfolio-performance:latest
docker push quallenbezwinger/portfolio-performance:$CONTAINER_VERSION
docker push quallenbezwinger/portfolio-performance:latest