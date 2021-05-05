#!/bin/bash
sudo mkdir -p /etc/blackbox
blackbox_exporter --version && exit 0

sudo apt update --qq
sudo apt-get install --qq curl tar

cd /tmp
curl -LO https://github.com/prometheus/blackbox_exporter/releases/download/v0.14.0/blackbox_exporter-0.14.0.linux-amd64.tar.gz
tar -xvf blackbox_exporter-0.14.0.linux-amd64.tar.gz

cp blackbox_exporter-0.14.0.linux-amd64/blackbox_exporter /usr/local/bin/
rm -rf /tmp/blackbox_exporter*

blackbox_exporter --version || { echo "Blackboc exporter installation failed"; exit 1; }

