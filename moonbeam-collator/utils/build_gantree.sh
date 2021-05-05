#!/usr/bin/bash

sudo apt-get install -qq git curl 

#get latest release
git clone https://github.com/gantree-io/gantree-node-watchdog
cd gantree-node-watchdog
export latest_gantree_release=$(git tag | tail -1)
cd ../
rm -rf gantree-node-watchdog

if [-f /usr/local/bin/gantree_node_watchdog]; then
	rm -rf /usr/local/bin/gantree_node_watchdog
fi
curl -L https://github.com/gantree-io/gantree-node-watchdog/releases/download/${latest_gantree_release}/gantree-node-watchdog-${latest_gantree_release}-linux.tar.gz | tar zx && wait
cp gantree-node-watchdog-${latest_gantree_release}-linux/bin/gantree_node_watchdog /usr/local/bin/.
rm -rf gantree-node-watchdog-${latest_gantree_release}-linux
sudo chown root:root /usr/local/bin/gantree_node_watchdog
sudo chmod 0755 /usr/local/bin/gantree_node_watchdog
