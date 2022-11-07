#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
GREEN_b=$(tput setab 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
BLUE_b=$(tput setab 4)

case $1 in
    start){
            for host in Master Slave-1 Slave-2
            do
            echo "${GREEN}========== 启动 $host Kafka ==========$(tput sgr0)"
            ssh $host "source /etc/profile; nohup ${KAFKA_HOME}/bin/kafka-server-start.sh -daemon ${KAFKA_HOME}/config/server.properties >/dev/null 2>&1 &"
            done
            echo "${GREEN_b}========== Kafka已全部启动 ==========$(tput sgr0)"
        };;
    stop){
            for host in Master Slave-1 Slave-2
            do
            echo "${RED}========== 停止 $host Kafka ==========$(tput sgr0)"
            ssh $host "source /etc/profile; ${KAFKA_HOME}/bin/kafka-server-stop.sh"
            done
            echo "${GREEN_b}========== Kafka已全部停止 ==========$(tput sgr0)"
        };;
    status){
            for host in Master Slave-1 Slave-2
            do
            echo "${BLUE_b}========== $host Kafka状态 ==========$(tput sgr0)"
            ssh Master "kafkacat -L -b $host"
            done
        };;
    restart|reload){
            echo "${YELLOW}========== Kafka集群 正在关闭 ==========$(tput sgr0)"
            for host in Master Slave-1 Slave-2
            do
            ssh $host "source /etc/profile; ${KAFKA_HOME}/bin/kafka-server-stop.sh"
            done
            sleep 1
            echo "${YELLOW}========== Kafka集群 正在重启 ==========$(tput sgr0)"
            for host in Master Slave-1 Slave-2
            do
            ssh $host "source /etc/profile; nohup ${KAFKA_HOME}/bin/kafka-server-start.sh -daemon ${KAFKA_HOME}/config/server.properties >/dev/null 2>&1 &"
            done
            echo "${BLUE_b}========== Kafka集群已重启 ========$(tput sgr0)"
        };;
    *){
		    echo Invalid Args!
		    echo "$(tput setab 1)Usage:$(tput sgr0) ${BLUE}(Kafka start|stop|status|restart|reload)"
		};;
esac

