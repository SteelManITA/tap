#!/usr/bin/env bash
docker stop RTapTweetConsumer

docker container rm RTapTweetConsumer

docker build ../R/ --tag tap:RTapTweetConsumer
docker run -v /usr/local/src/myscripts/ --network tap -e R_ACTION=tapconsumer --name RTapTweetConsumer -it tap:RTapTweetConsumer
