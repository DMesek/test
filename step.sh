#!/usr/bin/env bash
set -e

if [[ ! -z ${config_file_content} ]]; then
  echo "${config_file_content}" > default.conf
  sudo rm /etc/vpnc/default.conf
  sudo mv default.conf /etc/vpnc
  sudo cat /etc/vpnc/default.conf
fi

set -- ${commandline_options}
sudo vpnc "$@"
