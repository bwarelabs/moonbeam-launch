#!/usr/bin/bash
sudo apt-get install -qq ufw expect

sudo ufw allow to any port 22
sudo ufw allow to any port 30333
sudo ufw allow to any port 30334
sudo ufw allow to any port 9090 

sudo expect -c 'set timeout -1;
spawn sudo ufw enable;
expect -re "(.*)";
send "y\r";
expect eof'
