#!/usr/bin/bash

source .env

sudo apt-get install -qq git curl 

get latest release
cd ~
git clone https://github.com/PureStake/moonbeam
cd moonbeam
git checkout tags/$(git tag | tail -1)

install Substrate and prereqs
source $HOME/.cargo/env
curl https://getsubstrate.io -sSf | bash -s -- --fast
wait
cargo build --release
wait

cp ~/moonbeam/target/release/moonbeam ${HOME_DIR}
