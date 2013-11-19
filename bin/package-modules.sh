#/bin/bash

rm -f node_modules.tar.gz
rm -rf modules
cp -rp node_modules modules
rm -f modules/lib
cp -rp src/coffee/lib modules/
cd modules
tar zcvf ../node_modules.tar.gz *
cd ..
s3cmd put node_modules.tar.gz s3://york-emr/test/
