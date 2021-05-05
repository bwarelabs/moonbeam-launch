#!/bin/bash
sudo mkdir -p /etc/prometheus
sudo mkdir -p /var/lib/prometheus
prometheus --version && exit 0

sudo apt update --qq
sudo apt-get install --qq curl tar 

cd /tmp
curl -LO https://github.com/prometheus/prometheus/releases/download/v2.0.0/prometheus-2.0.0.linux-amd64.tar.gz
tar xvf prometheus-2.0.0.linux-amd64.tar.gz

sudo cp prometheus-2.0.0.linux-amd64/prometheus /usr/local/bin/
sudo cp prometheus-2.0.0.linux-amd64/promtool /usr/local/bin/
sudo cp -r prometheus-2.0.0.linux-amd64/consoles /etc/prometheus
sudo cp -r prometheus-2.0.0.linux-amd64/console_libraries /etc/prometheus

rm -rf /tmp/prometheus*
prometheus --version || { echo "Prometheus installation failed"; exit 1; }