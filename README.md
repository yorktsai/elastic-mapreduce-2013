Elastic Map Reduce
======

Start Cluster
======

```
elastic-mapreduce \
--create --alive --hive-interactive --name "Hive" --visible-to-all-users \
--availability-zone us-east-1d --log-uri s3n://york-emr-logs \
--bootstrap-action s3n://york-emr/scripts/install-node-bin-x86.sh \
--instance-group MASTER --instance-count 1 --instance-type m1.medium \
--instance-group CORE --instance-count 1 --instance-type m1.large
```

Bid task instances
```
elastic-mapreduce \
-j j-24WLWUJGB1K4P  \
--add-instance-group TASK --instance-count 2 \
--instance-type m1.large --bid-price 0.028
```

Port Forwarding
======

```
ssh -L 9100:localhost:9100 -L 9101:localhost:9101 \
-i ~/Dropbox/aws/york/elastic-mapreduce.pem hadoop@ec2-23-23-23-200.compute-1.amazonaws.com
```

SSH to master
======

```
elastic-mapreduce --list --active
elastic-mapreduce --ssh --jobflow [JobFlowID]
```

MapReduce Task
======

```
elastic-mapreduce --stream -j j-1UHUIYXD12Y88 \
        --input s3n://york-emr/samples/node/wordcount-sample.json \
        --output s3n://york-emr/test/node-output \
        --mapper s3n://york-emr/samples/node/wordcount-mapper.js \
        --reducer s3n://york-emr/samples/node/wordcount-reducer.js
```

Start Hive Cli
======
```
hive -i init.hql
```

CSV Export
======

Create csv table

```
CREATE TABLE action_count_csv (
    log_id string,
    action_count int
)
ROW FORMAT
    delimited fields terminated by ','
              lines terminated by '\n'
STORED AS TEXTFILE
LOCATION 's3n://york-emr/tables/action_count_csv';
```

Insert

```
INSERT OVERWRITE TABLE action_count_csv
    SELECT
        log_id, count(*) AS action_count
    FROM cdl
    GROUP BY log_id;
```

Or,  use local directory

```
INSERT OVERWRITE LOCAL DIRECTORY '/tmp/test.csv' SELECT * FROM tmp;
```

UDF
======

Default UDF(https://cwiki.apache.org/confluence/display/Hive/LanguageManual+UDF)

[functions](src/hive/init.hql)

* https://github.com/wdavidw/hive-udf
* https://github.com/nexr/hive-udf
* https://github.com/lovelysystems/ls-hive

Sqoop Install
======

```
bin/install-sqoop.sh j-O9HF7UNB9TRX
```

Sqoop Import
======

Copy src/sqoop/import-tables.php to master node and run.

Vim Tips
======
```
" Treat .hql files as SQL for syntax highlighting
au BufNewFile,BufRead *.hql set filetype=sql
```

Accessing Elastic MapReduce slave nodes via SSH
======
Start by adding your EMR identity to your SSH agent:

```
you@localhost: ssh-add /your/emr/private/key.pem
```

SSH to the master node with agent forwarding enabled:
```
you@localhost: ssh -A hadoop@ec2-0-0-0-0.us-west-1.compute.amazonaws.com
```

You can now SSH to slave nodes from the master:
```
hadoop@ip-of-master: ssh hadoop@10.168.0.0
```

The log files are in `/mnt/var/log/hadoop`:

```
hadoop@ip-of-slave-1: ls /mnt/var/log/hadoop
hadoop-hadoop-datanode-ip-10-168-79-191.us-west-1.compute.internal.log
hadoop-hadoop-datanode-ip-10-168-79-191.us-west-1.compute.internal.out
hadoop-hadoop-tasktracker-ip-10-168-79-191.us-west-1.compute.internal.log
hadoop-hadoop-tasktracker-ip-10-168-79-191.us-west-1.compute.internal.out
```
