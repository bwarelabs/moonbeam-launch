#!/bin/bash

source .env

sed -i "s/INSERT_FROM_ENV_FILE/${SLACK_API_URL}/g" config/alertmanager.yml

sudo bash start_prometheus.sh
sudo bash start_alertmanager.sh
sudo bash start_blackbox_exporter.sh
