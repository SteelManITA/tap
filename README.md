# tap
## ip
* 10.0.100.10 flume
* 10.0.100.22 zk-server
* 10.0.100.23 kafka-server
* 10.0.100.24 kafka-create topic
* 10.0.100.25 kafka-standalone-twitter-file
* 10.0.100.31 mysql-server
* 10.0.100.41 python-twitter-consumer
* 10.0.100.51 elasticsearch
* 10.0.100.52 kibaba
* 10.0.100.61 R

## Start
1. Zookeper (zkServerStart.sh)
	docker exec -it nome_container bash
	chmod +x /opt/zkui/zkui
	zkui
2. Kafkaserver (kafkaStartServer.sh)
3. flume (Kafka) (flumeTwitterKafka.sh)
	chmod +x opt/flume/bin/start-flume
	opt/flume/bin/start-flume
4. RTwitter (RTweetConsumer.sh)


Per entrare in un container (-it interactive):
docker exec -it nome_container bash

per vedere quale cartella ha assegnato docker al sistema locale:
docker inspect -f {{.Mounts}} nome_conainer 
