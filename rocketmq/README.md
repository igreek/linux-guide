# linux-guide

#### 
- A机器配置broker-a.properties/broker-b-s.properties

nohup sh mqnamesrv &

nohup sh mqbroker -c /opt/modules/rocketmq/conf/2m-2s-sync/broker-a.properties&

nohup sh mqbroker -c /opt/modules/rocketmq/conf/2m-2s-sync/broker-b-s.properties&



nohup sh mqbroker -c /opt/modules/rocketmq/conf/2m-2s-sync/broker-b.properties&

nohup sh mqbroker -c /opt/modules/rocketmq/conf/2m-2s-sync/broker-a-s.properties&

sh mqadmin clusterlist -n hadoop02:9876


export NAMESRV_ADDR='rocketmq01:9876;rocketmq02:9876'

sh bin/tools.sh org.apache.rocketmq.example.quickstart.Producer