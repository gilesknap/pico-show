#!/bin/bash
set -ex

this_dir=$(realpath "$(dirname "$0")")

cd "$this_dir"

# make sure we have an up to date virtualenv
uv sync

echo "[Unit]
Description=Monitor USB and send MAC address to any pico detected
After=multi-user.target

[Service]
ExecStart=${this_dir}/.venv/bin/python ${this_dir}/main.py
Restart=always

[Install]
WantedBy=multi-user.target
" | sudo tee /etc/systemd/system/pico-send.service

sudo systemctl enable pico-send --now
