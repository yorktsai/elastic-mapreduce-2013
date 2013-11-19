#!/bin/bash

cwd=`pwd`

# screen
sudo apt-get -y install screen g++-multilib
wget http://york-scripts.s3-website-us-east-1.amazonaws.com/screenrc
mv screenrc $HOME/.screenrc

# node
wget http://york-scripts.s3-website-us-east-1.amazonaws.com/node-v0.10.8-linux-x86.tar.gz
gzip -d node-v0.10.8-linux-x86.tar.gz && tar -xvf node-v0.10.8-linux-x86.tar

echo "export PATH=$cwd/node-v0.10.8-linux-x86/bin:$PATH" >> ~/.bashrc
echo "export NODE_PATH=$cwd/node-v0.10.8-linux-x86/lib/node_modules" >> ~/.bashrc
source ~/.bashrc

npm install -g coffee-script execSync

# hive
wget -O /home/hadoop/lib/jsonserde.jar http://york-scripts.s3-website-us-east-1.amazonaws.com/hive/jsonserde.jar
wget -O /home/hadoop/lib/adaltas-hive-udf-0.0.1-SNAPSHOT.jar http://york-scripts.s3-website-us-east-1.amazonaws.com/hive/adaltas-hive-udf-0.0.1-SNAPSHOT.jar
wget -O /home/hadoop/lib/nexr-hive-udf-0.2-SNAPSHOT.jar http://york-scripts.s3-website-us-east-1.amazonaws.com/hive/nexr-hive-udf-0.2-SNAPSHOT.jar
wget -O /home/hadoop/lib/ls-hive-0.7-SNAPSHOT.jar http://york-scripts.s3-website-us-east-1.amazonaws.com/hive/ls-hive-0.7-SNAPSHOT.jar

wget -O /home/hadoop/init.hql http://york-scripts.s3-website-us-east-1.amazonaws.com/hive/init.hql
