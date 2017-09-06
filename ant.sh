#!/bin/bash

set -e 

cd /root/opencit-contrib
git checkout v1.0+cit-3.2.1
ant

cd /root/opencit-util
git checkout v1.0+cit-3.2.1
ant

cd /root/opencit-privacyca
git checkout v3.2.1
ant

cd /root/opencit-tboot-xm
git checkout v3.2.1
ant

mvn install:install-file -DgroupId=com.intel.mtwilson.tbootxm.packages -DartifactId=tbootxm -Dversion=3.2.1-SNAPSHOT -Dclassifier=rhel -Dpackaging=bin -Dfile=/root/opencit-tboot-xm/packages/tbootxm/target/tbootxm-3.2.1-SNAPSHOT-centos.bin
cd /root/opencit-trustagent
git checkout v3.2.1
ant

cd /root/opencit
git checkout v3.2.1
ant

cd /root/opencit-vrtm
git checkout v3.2.1
ant

cd /root/opencit-policyagent
git checkout v3.2.1
ant

cd /root/opencit-docker-proxy
git checkout v3.2.1
ant

cd /root/opencit-kms
git checkout v3.2.1
ant

cd /root/opencit-director
git checkout v3.2.1
ant

mvn install:install-file -DgroupId=com.intel.mtwilson.vrtm.packages -DartifactId=vrtm -Dversion=3.2.1-SNAPSHOT -Dclassifier=rhel -Dpackaging=bin -Dfile=/root/opencit-vrtm/packages/vrtm/target/vrtm-3.2.1-SNAPSHOT-centos.bin
cd /root/opencit-openstack-extensions
git checkout v3.2.1
ant

cd /root/opencit-openstack-controller-extensions
git checkout v3.2.1
ant

cd /root/opencit-attestation-cache-hub
git checkout v3.2.1
ant

cd /root/opencit-quickstart
git checkout v3.2.1
ant

# gather artifacts
cd /root
shopt -s globstar
\cp -f opencit/installers/**/*.bin .

