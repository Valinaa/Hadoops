#!/bin/bash

### 前景色
# BLACK=$(tput setaf 0)
# RED=$(tput setaf 1)
GREEN_b=$(tput setab 2)
YELLOW_b=$(tput setab 3)
BLUE_b=$(tput setab 4)
# YANG_RED=$(tput setaf 5)
# YELLOW_2=$(tput setaf 6)
# WHITE=$(tput setaf 7)
HADOOP_SBIN="/opt/big-data/hadoop-3.3.4/sbin"

case $1 in
   start)
           $HADOOP_SBIN/start-dfs.sh
                   $HADOOP_SBIN/start-yarn.sh
                   mapred --daemon start historyserver
                   echo "${GREEN_b}========== hadoop start successfully ==========$(tput sgr0)"
           ;;
   stop)
           mapred --daemon stop historyserver
                   $HADOOP_SBIN/stop-yarn.sh
           $HADOOP_SBIN/stop-dfs.sh
                   echo "${GREEN_b}========== hadoop stop successfully ==========$(tput sgr0)"
           ;;
   restart|reload|force-reload)
           mapred --daemon stop historyserver
                   $HADOOP_SBIN/stop-yarn.sh
           $HADOOP_SBIN/stop-dfs.sh
                   echo "${YELLOW_b}========== hadoop has stopped ==========$(tput sgr0)"
                   sleep 2
           $HADOOP_SBIN/start-dfs.sh
                   $HADOOP_SBIN/start-yarn.sh
                   mapred --daemon start historyserver
                   echo "${BLUE_b}========== hadoop restart successfully ==========$(tput sgr0)"
            ;;
   status)
             /opt/big-data/tools/jpsall.sh
            ;;
   *) 
	    echo Invalid Args!
	    echo "$(tput setab 1)Usage:$(tput sgr0) $(tput setaf 4)(Hadoop start|stop|status|restart)$(tput sgr0)"
            ;;
esac

