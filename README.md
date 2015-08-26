# docker-fluentd-kafka-example


## 動作手順

-  fluent.confのzookeeperのipを書き換える

```
$ boot2docker ip
192.168.59.103

もしくは
$ docker-machine ip MACHINE_NAME
192.168.59.103

$ docker ps
CONTAINER ID        IMAGE                           COMMAND                CREATED             STATUS              PORTS                                                 NAMES
da62bbeb25c7        yutaono/dfk:latest              "/bin/sh -c td-agent   14 minutes ago      Up 14 minutes                                                             thirsty_leakey
688a69397285        kafkadocker_kafka:latest        "/bin/sh -c start-ka   About an hour ago   Up About an hour    0.0.0.0:32769->9092/tcp                               kafkadocker_kafka_1
5d68de4cd9e9        wurstmeister/zookeeper:latest   "/bin/sh -c '/usr/sb   About an hour ago   Up About an hour    22/tcp, 2888/tcp, 3888/tcp, 0.0.0.0:32768->2181/tcp   kafkadocker_zookeeper_1

zookeeperのところを192.168.69.103:32768にする
```

- docker image 作成

```
$ docker build -t yutaono/dfk . 
```

- 実行

```
$ mkdir `pwd`/log
$ docker run -d -v `pwd`/log:/var/log/app yutaono/dfk
```
