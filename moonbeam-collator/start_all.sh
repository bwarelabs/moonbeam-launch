#!/usr/bin/bash


while getopts ":g:" opt; do
  case ${opt} in
    g)
      if [ ${OPTARG} != "no" -a ${OPTARG} != "yes" ]; then
      	echo "Invalid value: ${OPTARG}" >&2
	exit 1
      fi
      export configure_gantree=${OPTARG}
      ;;
    \?)
      echo "Invalid option: -${OPTARG}" >&2
      exit 1
      ;;
    :)
      echo "Option -${OPTARG} requires an argument." >&2
      exit 1
      ;;
  esac
done

source .env

adduser moonbase_service --system --no-create-home
if [ -d ${HOME_DIR} ]; then #for purging only
	rm -rf ${HOME_DIR}
fi
mkdir ${HOME_DIR}
chown moonbase_service ${HOME_DIR}

sudo bash utils/build_moonbeam.sh && \
sudo bash utils/setup_firewall.sh || \
{ echo "Installing moonbeam dependencies failed"; exit 1; }

sudo bash utils/config_moonbeam_service.sh

sudo systemctl daemon-reload

sudo systemctl enable moonbeam.service
sudo systemctl restart moonbeam.service

if [ $configure_gantree = "yes" ]; then
	sudo bash utils/prepare_gantree_config.sh && \
	sudo bash utils/build_gantree.sh || \
	{ echo "Installing gantree dependencies failed"; exit 1; }

	sudo bash utils/config_gantree_service.sh
	
	sudo systemctl daemon-reload

	sudo systemctl enable gantree-relay.service
        sudo systemctl enable gantree-parachain.service

	sudo systemctl restart gantree-relay.service
	sudo systemctl restart gantree-parachain.service
fi
