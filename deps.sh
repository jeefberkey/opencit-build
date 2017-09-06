#!/bin/bash

cd /root/opencit-external-artifacts
git checkout v1.0+cit-3.2.1 

wget --quiet --no-check-certificate https://mmonit.com/monit/dist/monit-5.5.tar.gz
mv -f monit-5.5.tar.gz monit/monit-5.5-linux-src.tgz

wget --quiet --no-check-certificate https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.34/bin/apache-tomcat-7.0.34.tar.gz
mv -f apache-tomcat-7.0.34.tar.gz apache-tomcat/apache-tomcat-7.0.34.tar.gz

wget --quiet --no-check-certificate https://sourceforge.net/projects/vijava/files/vijava/VI%20Java%20API%205.5%20Beta/vijava55b20130927.zip
unzip vijava55b20130927.zip
mv -f vijava55b20130927.jar vijava/vijava-5.5.jar

wget --quiet --no-check-certificate https://sourceforge.net/projects/kmip4j/files/KMIP4J-V1.0/kmip4j-bin-1.0.zip
unzip kmip4j-bin-1.0.zip
mv -f jar/kmip4j.jar kmip4j/kmip4j-1.0.jar

wget --quiet --no-check-certificate https://sourceforge.net/projects/ext2fsd/files/Ext2fsd/0.62/Ext2Fsd-0.62.exe
mv -f Ext2Fsd-0.62.exe ext2fsd/Ext2Fsd-0.62.exe

wget --quiet --no-check-certificate https://sourceforge.net/projects/trousers/files/tpm-tools/1.3.8/tpm-tools-1.3.8.tar.gz
mv -f tpm-tools-1.3.8.tar.gz tpm-tools/tpm-tools-1.3.8.tar.gz

mv -f /vagrant/jre-8u144-windows-x64.tar.gz jre-windows/jre-1.8-windows-x64.tar.gz

rm -rf *.zip
rm -rf *.jar
rm -rf XenServer-SDK


