# Starrocks Experiments

Toying with getting Starrocks & Redpanda Kafka to work.

### Start SR + Redpanda Kafka 
```commandline
docker compose up -d
```
Then ```mysql -h 127.0.0.1 -P9030 -uroot```
and copy-paste snippets from from [script.sql](./script.sql) into the mysql CLI.

Once done, fire off 5 payloads to Kafka with
```commandline
# pip install kafka-python  # run this once if not installed yet
python gen.py 5
```

### Puzzle: 
This table remains empty - why???
```sql
select * from example_tbl2;
```
even though the payloads are on Kafka, see Redpanda Console at http://localhost:8080/topics/test2

#### Error from logs
```
2024-06-05 01:52:36.781Z WARN (Routine load scheduler|43) [KafkaUtil$ProxyAPI.sendProxyRequest():235] Failed to send get kafka partition info request to BE TNetworkAddress(hostname:10.223.1.5, port:8060), err: Ocurrs time out with specfied time 12 SECONDS
```

### Random snippets
docker exec broker kafka-topics --bootstrap-server 100.5.0.7:9092 --create --topic test2


mysql -uroot -h 127.0.0.1 -P 9030


show routine load for DEMO.test2\G

docker exec -it starrocks-fe bash  -> fe/log/fe.log
docker exec -it starrocks-cn bash  -> be/log/cn.INFO
