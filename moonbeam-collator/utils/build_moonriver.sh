#!/usr/bin/bash

source .env

sudo apt-get install -qq git curl 

wget https://github.com/PureStake/moonbeam/releases/download/v0.9.1/moonbeam

cp ./moonbeam ${HOME_DIR}
