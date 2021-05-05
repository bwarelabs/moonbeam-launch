#!/usr/bin/env sh

source .env

cat > /etc/systemd/system/moonbeam.service <<EOF
[Unit]
Description="Moonbase Alpha systemd service"
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=on-failure
RestartSec=10
User=moonbase_service
SyslogIdentifier=moonbase
SyslogFacility=local7
KillSignal=SIGHUP
ExecStart=${HOME_DIR}/moonbeam \
     --parachain-id ${PARACHAIN_ID} \
     --collator \
     --author-id ${PUBLIC_KEY} \
     --port 30333 \
     --rpc-port 9933 \
     --ws-port 9944 \
     --pruning=archive \
     --unsafe-rpc-external \
     --unsafe-ws-external \
     --rpc-methods=Safe \
     --rpc-cors all \
     --log rpc=info \
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
