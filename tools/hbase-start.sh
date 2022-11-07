#!/bin/bash
HBASE_BIN="/opt/big-data/hbase-2.4.14/bin"

GREEN_b=$(tput setab 2)
YELLOW_b=$(tput setab 3)
BLUE=$(tput setaf 4)
BLUE_b=$(tput setab 4)
case $1 in
	start)
		$HBASE_BIN/start-hbase.sh start
			echo "${GREEN_b}========== HBase start successfully ==========$(tput sgr0)"
		;;
	stop)
		$HBASE_BIN/stop-hbase.sh stop
			echo "${GREEN_b}========== HBase has stopped ==========$(tput sgr0)"
		;;
	restart|reload)
			echo "${YELLOW_b}========== HBase  restarting ==========$(tput sgr0)"
		$HBASE_BIN/stop-hbase.sh stop
			sleep 1
		$HBASE_BIN/start-hbase.sh start
			echo "${BLUE_b}========== zeppelin has restarted ==========$(tput sgr0)"
		;;
	*)
		echo Invalid Args!
		echo "$(tput setab 1)Usage:$(tput sgr0) ${BLUE}(HBase start|stop|restart|reload)$(tput sgr0)"
		;;
esac
