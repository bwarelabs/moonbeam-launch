#!/bin/bash
sudo bash setup/install_prometheus.sh
sudo cp -fR config /etc/prometheus/

USER=$(whoami)
cat > /etc/systemd/system/prometheus.service <<EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=$USER
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/config/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

Restart=always
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl restart prometheus