#!/bin/bash
### 前景色
GREEN_b=$(tput setaf 2)
YELLOW_b=$(tput setaf 3)
BLUE=$(tput setaf 4)
BLUE_b=$(tput setab 4)

ZEPPELIN_BIN="/opt/big-data/zeppelin-0.10.1/bin"
case $1 in
	start)
		$ZEPPELIN_BIN/zeppelin-daemon.sh start
			echo "${GREEN_b}========== zeppelin start successfully ==========$(tput sgr0)"
			;;
	stop)
		$ZEPPELIN_BIN/zeppelin-daemon.sh stop
			echo "${GREEN_b}========== zeppelin has stopped ==========$(tput sgr0)"
			;;
	restart|reload)
			echo "${YELLOW_b}========== zeppelin  restarting ==========$(tput sgr0)"
		$ZEPPELIN_BIN/zeppelin-daemon.sh stop
			sleep 1
		$ZEPPELIN_BIN/zeppelin-daemon.sh start
			echo "${BLUE_b}========== zeppelin has restarted ==========$(tput sgr0)"
		;;
	*)
		echo Invalid Args!
		echo "$(tput setab 1)Usage:$(tput sgr0) ${BLUE}(Zeppelin start|stop|restart)"
		;;
esac
