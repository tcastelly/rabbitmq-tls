FROM rabbitmq:4-management-alpine as base

# certiticates are stored in /certs

RUN apk update &&\
  apk add entr

COPY conf/entrypoint.sh /entrypoint.sh

COPY conf/reload-tls.sh /reload-tls.sh

COPY conf/rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

COPY conf/advanced.config /etc/rabbitmq/advanced.config

RUN rabbitmq-plugins enable --offline rabbitmq_mqtt

ENTRYPOINT ["/entrypoint.sh"]

##
## Production with cluster
##

FROM base as cluster

# enable cluster
RUN sed -i "s/# cluster_formation/cluster_formation/g" /etc/rabbitmq/rabbitmq.conf
