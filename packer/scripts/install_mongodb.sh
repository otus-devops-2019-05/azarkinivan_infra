#!/bin/sh

set -e
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
apt-get update
apt-get install -y --allow-unauthenticated mongodb-org
systemctl enable mongod
