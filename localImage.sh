#!/bin/bash

docker build --build-arg VERSION=${PP_VERSION} . -t quallenbezwinger/portfolio-performance:$CONTAINER_VERSION
docker build --build-arg VERSION=${PP_VERSION} . -t quallenbezwinger/portfolio-performance:latest