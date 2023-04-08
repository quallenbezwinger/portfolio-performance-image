#!/bin/bash

docker build . -t quallenbezwinger/portfolio-performance:$CONTAINER_VERSION
docker build . -t quallenbezwinger/portfolio-performance:latestt