#!/bin/bash
sudo mkdir -p /etc/alertmanager
alertmanager --version && exit 0

sudo apt update --qq
sudo apt-get install --qq curl tar 

cd /tmp
curl -LO https://github.com/prometheus/alertmanager/releases/download/v0.17.0/alertmanager-0.17.0.linux-amd64.tar.gz
tar -xvf alertmanager-0.17.0.linux-amd64.tar.gz

cp alertmanager-0.17.0.linux-amd64/alertmanager /usr/local/bin/
cp alertmanager-0.17.0.linux-amd64/amtool /usr/local/bin/

rm -rf /tmp/alertmanager*
alertmanager --version || { echo "Alert manager installation failed"; exit 1; }