#!/usr/bin/env bash

docker run --rm -p 1111:7200 dhlabbasel/graphdb-free &

docker run --rm -p 2222:7200 dhlabbasel/graphdb-free &