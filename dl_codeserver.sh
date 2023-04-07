#!/usr/bin/bash

(wget https://github.com/coder/code-server/releases/download/v4.11.0/code-server_4.11.0_amd64.deb);

(sudo apt install ./code-server_*_amd64.deb);

(sudo systemctl start code-server@$USER);

(sudo systemctl enable --now code-server@$USER);

(nano ~/.config/code-server/config.yaml);


