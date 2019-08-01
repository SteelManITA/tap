#!/usr/bin/env bash
docker stop kafkaZookeeperWebUI

docker container rm kafkaZookeeperWebUI

docker build ../zookeeper/ --tag tap:kafka
docker run --network tap --ip 10.0.100.22 -d -p 9090:9090 --name kafkaZookeeperWebUI -t tap:kafka
