#!/bin/bash
sudo bash setup/install_blackbox_exporter.sh
sudo cp -fR config /etc/blackbox

USER=$(whoami)
cat > /etc/systemd/system/blackbox_exporter.service <<EOF
[Unit]
Description=Blackbox Exporter Service
Wants=network-online.target
After=network-online.target

[Service]
User=$USER
Type=simple
WorkingDirectory=/etc/blackbox/
ExecStart=/usr/local/bin/blackbox_exporter \
  --config.file=/etc/blackbox/config/blackbox.yml \
  --web.listen-address="127.0.0.1:9115"

Restart=always
[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl restart blackbox_exporter