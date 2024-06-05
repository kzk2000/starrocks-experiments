
CREATE DATABASE sr_hub;

USE sr_hub;

CREATE TABLE example_tbl2 (
    `uid` bigint NOT NULL COMMENT "uid",
    `site` date NOT NULL COMMENT "site url",
    `vtime` bigint NOT NULL COMMENT "vtime"
)
DISTRIBUTED BY HASH(`uid`)
PROPERTIES("replication_num"="1");

STOP ROUTINE LOAD FOR example_tbl2_test2;

CREATE ROUTINE LOAD example_tbl2_test2 ON example_tbl2
PROPERTIES
(
    "format" = "json"
)
FROM KAFKA
(
    "kafka_broker_list" = "redpanda:29092",
    "kafka_topic" = "test2",
    "kafka_partitions" = "0",
    "kafka_offsets"="OFFSET_BEGINNING"
);


select * from example_tbl2;