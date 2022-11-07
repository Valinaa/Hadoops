#!/bin/bash

BLUE_b=$(tput setab 4)

for host in Slave-1 Slave-2 Master
do
        case $1 in
        start){
                echo "${BLUE_b}------------ $host zookeeper -----------$(tput sgr0)"
                ssh $host "source /etc/profile; zkServer.sh start"
        };;
        stop){
                echo "${BLUE_b}------------ $host zookeeper -----------$(tput sgr0)"
                ssh $host "source /etc/profile; zkServer.sh stop"
        };;
        status){
                echo "${BLUE_b}------------ $host zookeeper -----------$(tput sgr0)"
                ssh $host "source /etc/profile; zkServer.sh status"
        };;
        restart|reload){
        	echo "${BLUE_b}------------ $host zookeeper -----------$(tput sgr0)"
		ssh $host "source /etc/profile; zkServer.sh restart"
	};;
        *){
		echo Invalid Args!
		echo "$(tput setab 1)Usage:$(tput sgr0) $(tput setaf 4)(ZooKeeper start|stop|restart|reload)$(tput sgr0)"
		break
	};;
       esac
done


