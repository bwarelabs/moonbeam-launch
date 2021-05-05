#!/usr/bin/env sh

source .env

cat > /etc/systemd/system/gantree-relay.service <<EOF
# Contents of /etc/systemd/system/gantree-relay.service

[Unit]
Description=Gantree Node Watchdog Relay
After=network.target

[Service]
WorkingDirectory=${GANTREE_HOME_DIR}/relay
Type=simple
Restart=always
ExecStart=/usr/local/bin/gantree_node_watchdog

[Install]
WantedBy=multi-user.target
EOF

cat > /etc/systemd/system/gantree-parachain.service <<EOF
# Contents of /etc/systemd/system/gantree-parachain.service

[Unit]
Description=Gantree Node Watchdog Parachain
After=network.target

[Service]
WorkingDirectory=${GANTREE_HOME_DIR}/parachain
Type=simple
Restart=always
ExecStart=/usr/local/bin/gantree_node_watchdog

[Install]
WantedBy=multi-user.target
EOF
