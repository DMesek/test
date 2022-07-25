#!/usr/bin/env bash
set -e

git clone https://github.com/breiter/vpnc.git
cd vpnc
make
sudo make install

echo "Successfully installed vpnc."

if [[ ! -z ${config_file_content} ]]; then
  echo "${config_file_content}" > default.conf
  sudo rm /etc/vpnc/default.conf
  sudo mv default.conf /etc/vpnc
fi

set -- ${commandline_options}
sudo vpnc "$@"

echo "Connected via VPNC."
