#!/bin/bash
sudo bash setup/install_alertmanager.sh
sudo cp -fR config /etc/alertmanager/

USER=$(whoami)
cat > /etc/systemd/system/alertmanager.service <<EOF
[Unit]
Description=Alertmanager
Wants=network-online.target
After=network-online.target

[Service]
User=$USER
Type=simple
WorkingDirectory=/etc/alertmanager/
ExecStart=/usr/local/bin/alertmanager --config.file=/etc/alertmanager/config/alertmanager.yml --web.external-url http://127.0.0.1:9093

Restart=always
[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl restart alertmanager