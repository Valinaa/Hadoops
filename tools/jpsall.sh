#!/bin/bash
### 前景色
GREEN_b=$(tput setab 2)
BLUE_b=$(tput setab 4)
# 执行jps命令查询每台服务器上的节点状态
echo "${BLUE_b}======================集群节点状态====================$(tput sgr0)"

for i in Slave-1 Slave-2 Master
do
        echo "${GREEN_b}====================== $i ====================$(tput sgr0)"
        ssh hadoop0@$i '/usr/local/jdk1.8/bin/jps'
done

