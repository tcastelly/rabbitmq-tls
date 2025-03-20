#!/bin/sh

find /certs/ | entr -n bash -c "/reload-tls.sh" > ~/rabbitmq-reload.log 2>&1 &

rabbitmq-server
