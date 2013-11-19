#!/bin/bash
#Install Sqoop - s3://<BUCKET_NAME>/install_sqoop.sh
cd
hadoop fs -copyToLocal s3://york-emr/libs/sqoop-1.4.4.bin__hadoop-1.0.0.tar.gz sqoop-1.4.4.bin__hadoop-1.0.0.tar.gz
tar -xzf sqoop-1.4.4.bin__hadoop-1.0.0.tar.gz

hadoop fs -copyToLocal s3://york-emr/libs/mysql-connector-java-5.1.26.tar.gz mysql-connector-java-5.1.26.tar.gz
tar -xzf mysql-connector-java-5.1.26.tar.gz
cp mysql-connector-java-5.1.26/mysql-connector-java-5.1.26-bin.jar sqoop-1.4.4.bin__hadoop-1.0.0/lib/

ln -s sqoop-1.4.4.bin__hadoop-1.0.0 sqoop
