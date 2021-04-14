#!/bin/bash
export KAFKA_HOME=/kafka_2.12-2.7.0
$KAFKA_HOME/bin/zookeeper-server-start.sh -daemon $KAFKA_HOME/config/zookeeper.properties \
&& until echo ruok | nc 127.0.0.1 2181 > /dev/null; do sleep 1; done \
&& $KAFKA_HOME/bin/kafka-server-start.sh -daemon $KAFKA_HOME/config/server.properties \
&& until echo ruok | nc 127.0.0.1 9092 > /dev/null; do sleep 1; done