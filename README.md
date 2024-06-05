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