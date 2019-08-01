#!/usr/bin/env bash
docker stop tapflume

docker container rm tapflume

#REM Build
docker build ../flume/ --tag tap:flume

#REM Run
docker run --network tap --ip 10.0.100.10  -it -e FLUME_CONF_FILE=twitterKafka.conf --name tapflume tap:flume
