#!/bin/bash

docker-compose \
  -f ./docker-compose.yml up --build

./stop-compose
