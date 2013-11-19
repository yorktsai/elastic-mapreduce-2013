#!/bin/bash

elastic-mapreduce -j $1 --jar s3://york-emr/libs/script-runner.jar --arg s3://york-emr/libs/install-sqoop.sh

elastic-mapreduce -j $1 --hive-script s3://york-emr/hive/create-mysql-databases.hql
