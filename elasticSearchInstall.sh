## We will install elastic search on Ubuntu OS and further install Logstash, Kibana and beats and finish the cofiguration.
##Installation on Ubuntu with root or sudo: any version
sudo apt-get-install openjdk-8--jre-headless  ## -- This will install the pre-requisite to install java-- ##


### To install Elastic Search refer to this - https://www.elastic.co/guide/en/elastic-stack-get-started/current/get-started-elastic-stack.html#install-elasticsearch
##Note: We can also use wget package inplace of curl -LO below

## -- rpm installation -- 7.16 is the latest by the time I am writing this doc##
#curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.16.0-x86_64.rpm
#sudo rpm -ivh elasticsearch-7.16.0-x86_64.rpm
#sudo service elasticsearch start

## -- Tarball install -- #
#curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.16.0-linux-x86_64.tar.gz
#tar -xzvf elasticsearch-7.16.0-linux-x86_64.tar.gz
#cd elasticsearch-7.16.0
#./bin/elasticsearch

# -- dpkg install -- #
curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.16.0-amd64.deb
sudo dpkg -i elasticsearch-7.16.0-amd64.deb
sudo /etc/init.d/elasticsearch start 
## or 
sudo service elasticsearch start
sleep 30
curl -v http://192.168.0.12

## - Configuring elastic search - /etc/elasticsearch/elasticsearch.yml ##
#change clustername, 
set ES_HOME=/etc/elasticsearch
sed -i /s/"#cluster.name: my-application"/"cluster.name: globo.monitoring"/g  $ES_HOME/elasticsearch.yml;
sed -i /s/"#node.name: node-1"/"node.name: <hostname of linux server>"/g  $ES_HOME/elasticsearch.yml;
sed -i /s/"#network.host: 192.168.0.1"/"network.host: 192.168.0.12"/g  $ES_HOME/elasticsearch.yml;

## change vm.max_map_count - to increase the default memory-map which is extensively used by ES
sysctl -w vm.max_map_count = 262144
