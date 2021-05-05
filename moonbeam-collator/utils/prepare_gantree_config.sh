#!/usr/bin/bash

source .env

if [ -d ${GANTREE_HOME_DIR} ]; then
	rm -rf ${GANTREE_HOME_DIR}
fi
mkdir ${GANTREE_HOME_DIR}
mkdir ${GANTREE_HOME_DIR}/relay
mkdir ${GANTREE_HOME_DIR}/parachain

cat > ${GANTREE_HOME_DIR}/relay/.gnw_config.json <<EOF
{
    "api_key": "${GANTREE_API_KEY}",
    "project_id": "${GANTREE_PROJECT_ID}",
    "client_id": "${GANTREE_PARTIAL_CLIENT_ID}-relay",
    "pckrc": "${GANTREE_PCK_KEY}",
    "metrics_host": "http://${GANTREE_METRICS_HOST_IP}:${GANTREE_METRICS_RELAY_HOST_PORT}"
}
EOF

cat > ${GANTREE_HOME_DIR}/parachain/.gnw_config.json <<EOF
{
    "api_key": "${GANTREE_API_KEY}",
    "project_id": "${GANTREE_PROJECT_ID}",
    "client_id": "${GANTREE_PARTIAL_CLIENT_ID}-parachain",
    "pckrc": "${GANTREE_PCK_KEY}",
    "metrics_host": "http://${GANTREE_METRICS_HOST_IP}:${GANTREE_METRICS_PARACHAIN_HOST_PORT}"
}
EOF
