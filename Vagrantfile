# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "2"
  end

  config.vm.synced_folder '.', '/vagrant', type: 'rsync'

  #config.vm.network :private_network, ip: '192.168.50.4' 

  config.vm.provision "baseline", type: "shell", inline: <<-SHELL
    yum install -y epel-release
    yum install -y vim git deltarpm htop ncdu tree jq


  SHELL

  config.vm.provision "build_deps", type: "shell", inline: <<-SHELL
    # https://github.com/opencit/opencit/wiki/Open-CIT-3.2.1-Product-Guide#140-building-opencit-from-source
    yum update -y 
    yum install -y openssh ant git make gcc gcc-c++ openssl openssl-devel unzip zip patch wget
    yum install -y makeself nsis 
    yum install -y /vagrant/jdk-8u144-linux-x64.rpm ; true
    yum install -y /vagrant/authbind-2.1.1-0.1.x86_64.rpm ; true
  SHELL

  config.vm.provision "maven", type: "shell", inline: <<-SHELL
    if [[ ! -d /usr/local/apache-maven-3.3.1 ]]; then
      wget --quiet http://archive.apache.org/dist/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.zip
      unzip -q apache-maven-3.3.1-bin.zip
      mv apache-maven-3.3.1 /usr/local
    fi
  SHELL

  config.vm.provision "file", source: 'opencit-build.sh', destination: '/tmp/opencit-build.sh'
  config.vm.provision "shell", inline: 'cp /tmp/opencit-build.sh /etc/profile.d/opencit-build.sh'

  config.vm.provision "clone", type: "shell", inline: <<-SHELL
    cd /root
    for proj in $(cat /vagrant/projects.txt); do
      if [[ ! -d "$proj" ]]; then
        git clone https://github.com/opencit/${proj};
      fi
    done
    true
  SHELL
  
  config.vm.provision "shell", path: 'deps.sh'
  config.vm.provision "shell", path: 'deps.sh'
  config.vm.provision "shell", path: 'ant.sh'
  
  config.vm.provision "file", source: 'mtwilson.env', destination: '/tmp/mtwilson.env'
  config.vm.provision "shell", inline: 'cp /tmp/mtwilson.env /root/mtwilson.env'

  config.vm.provision "user", type: "shell", inline: <<-SHELL
    source /root/mtwilson.env
    mkdir -p $MTWILSON_HOME
    useradd --comment "Mt Wilson" --home $MTWILSON_HOME --system --shell /bin/bash $MTWILSON_USERNAME
    chown -R $MTWILSON_USERNAME:$MTWILSON_USERNAME $MTWILSON_HOME
    mkdir -p /opt/intel /opt/mtwilson /var/opt/intel /usr/local/share/mtwilson /etc/intel/cloudsecurity
    chown -R $MTWILSON_USERNAME:$MTWILSON_USERNAME /opt/intel /opt/mtwilson /var/opt/intel /usr/local/share/mtwilson /etc/intel
  SHELL

end

