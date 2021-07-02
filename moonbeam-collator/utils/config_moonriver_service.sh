#!/usr/bin/env sh

source .env

cat > /etc/systemd/system/moonriver.service <<EOF
[Unit]
Description="Moonriver systemd service"
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=on-failure
RestartSec=10
User=moonriver_service
SyslogIdentifier=moonriver
SyslogFacility=local7
KillSignal=SIGHUP
ExecStart=${HOME_DIR}/moonbeam \
     --validator \
     --port 30333 \
     --rpc-port 9933 \
     --ws-port 9944 \
     --pruning=archive \
     --state-cache-size 1 \
     --unsafe-rpc-external \
     --unsafe-ws-external \
     --rpc-methods=Safe \
     --rpc-cors all \
     --base-path ${HOME_DIR} \
     --chain ${CHAIN_NAME} \
     --name ${NODE_NAME} \
     -- \
     --port 30334 \
     --rpc-port 9934 \
     --ws-port 9945 \
     --pruning=archive \
     --name=${NODE_NAME} \
     --in-peers ${IN_PEERS} \
     --out-peers ${OUT_PEERS}

[Install]
WantedBy=multi-user.target
EOF
