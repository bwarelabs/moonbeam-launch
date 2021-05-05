# [BwareLabs] Deploy a Moonbeam collator

## ![alt text](/docs/BWARE-icon.png) IMPORTANT NOTICE
**The scripts were tested on Ubuntu 20.04 LTS machines which respect the hardware requirements imposed by Moonbeam as seen [here](https://docs.moonbeam.network/node-operators/networks/full-node/#requirements).**
## ![alt text](/docs/BWARE-icon.png) Contents of the main directory
- _.env_ - this contains important environment variables which are needed in order to properly deploy the node
  - **HOME_DIR** - directory which contains the blockchain data (recommended value: /var/lib/alphanet-data)
  - **PARACHAIN_ID** - self-explanatory (for this version of the testnet: 1000)
  - **PUBLIC_KEY** - public key of the wallet associated with the collator (of course, you need to create a wallet)
  - **CHAIN_NAME** - self-explanatory (for this version of the testnet: alphanet)
  - **NODE_NAME** - node name of your desire
  - **IN_PEERS** - number of IN_PEERS supported (recommended value: 200)
  - **OUT_PEERS** - number of OUT_PEERS supported (recommended value: 200)
  - **GANTREE_HOME_DIR** - directory which contains configuration files for the Gantree watchdog (recommended value: /var/lib/gantree)
  - **GANTREE_API_KEY** - API key which can be generated from the Gantree [UI](https://app.gantree.io/#/dashboard) (you need to make an account first and log in)
  - **GANTREE_PCK_KEY** - this is provided by the Moonbeam team (ask for it on the Discord channel called _#collators_)
  - **GANTREE_PROJECT_ID** - name of the chain in gantree (for this version of the testnet: moonbase-alpha)
  - **GANTREE_PARTIAL_CLIENT_ID** - similar to NODE_NAME (supports only [a-zA-Z0-9])
  - **GANTREE_METRICS_HOST_IP** - IP exposed for metrics (usually localhost - 127.0.0.1)
  - **GANTREE_METRICS_RELAY_HOST_PORT** - port exposed for metrics for Relay (usually 9615)
  - **GANTREE_METRICS_PARACHAIN_HOST_PORT** - port exposed for metrics for Parachain (usually 9616)
- _start_all.sh_ - main script that starts the deployment of the Casper node
- _utils_ - directory which contains helper scripts

## ![alt text](/docs/BWARE-icon.png) Contents of utils directory
- _build_gantree.sh_ - downloads latest Gantree version and installs the binaries
- _build_moonbeam.sh_ - downloads latest Moonbeam version & data and installs the binaries
- _config_gantree_service.sh_ - configures Gantree as a service (can be checked with _systemctl status SERVICE_NAME_)
- _config_moonbeam_service.sh_ - configures Moonbeam as a service (cand be checked with _systemctl status SERVICE_NAME_)
- _prepare_gantree_config.sh_ - prepares Gantree configuration (data is taken from _.env_ file in main directory)
- _setup_firewall.sh_ - configures ufw firewall, allowing acces to important ports

## ![alt text](/docs/BWARE-icon.png) First steps
- Make sure you have git installed on your machine (if not sure, you can run the following command to make sure you have the package installed)
```
sudo apt install git -y 
```
- Clone the git main git repository via HTTPS or SSH (below example is with HTTPS since it's easier, but it is not the recommended way)
```
git clone https://github.com/bwarelabs/moonbeam-launch.git
```

## ![alt text](/docs/BWARE-icon.png) How to deploy the node
- Go to moonbeam-launch/moonbeam-collator directory
```
cd moonbeam-launch/moonbeam-collator
```
- Carefully complete _.env_ with the appropiate values, depending on your use case
- Run the following command in your terminal:
```
sudo bash start_all.sh -g yes # fresh install or need to re-install Gantree also
##### OR #####
sudo bash start_all.sh -g no  # skip Gantree installation - will ignore the Gantree variables
                              # defined in .env
```
- The _-g_ option is regarding the gantree installation - use _yes_ if you wish to install gantree (this is always the case when you first deploy a collator) or _no_ if you are just updating to a newer version of Moonbeam
- This can be run as root, the user handling is made inside the scripts
- **IMPORTANT: GANTREE IS A MUST IF YOU WISH TO BE A COLLATOR - YOU SHOULD FIRST CREATE AN ACCOUNT TO OBTAIN AN API KEY AND AFTER INSTALLING THE GANTREE SERVICES YOU SHOULD PROVISION A DASHBOARD FROM THE [UI](https://app.gantree.io/#/dashboard)**
- **IMPORTANT: THE SCRIPT PURGES THE PREVIOUS DATA (SINCE THIS IS THE WAY UPDATES ARE USUALLY MADE) - WILL IMPLEMENT OPTION FOR THE SCRIPT (PURGE/NO PURGE)**
- **IMPORTANT: DEPLOYING THE NODE IS NOT ENOUGH - IF YOU WISH TO PRODUCE BLOCKS, YOU SHOULD FOLLOW THE STEPS INCLUDED HERE FOR [COLLATORS](https://docs.moonbeam.network/node-operators/networks/collator/)**

## ![alt text](/docs/BWARE-icon.png) Contact

For official inquiries, you can contact us at <info@bwarelabs.com>.

For other details, feel free to contact us on **Discord** (_Mateip | bwarelabs.com#1629_, _Silviu | bwarelabs.com#8286_, _Tibi | bwarelabs.com#4803_).

## ![alt text](/docs/BWARE-icon.png) Copyright

Copyright © 2021 [BwareLabs](https://bwarelabs.com/)
- [Telegram](https://t.me/BwareLabsAnnouncements)
- [Twitter](https://twitter.com/BwareLabs)
- [Linkedin](https://www.linkedin.com/company/bwarelabs)

![alt text](/docs/BWARE_yellow_gradient.png)
