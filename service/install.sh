#!/bin/bash
set -ex

this_dir=$(dirname "$0")

echo '[Unit]
Description=Monitor USB and send MAC address to any pico detected
After=multi-user.target

[Service]
ExecStart=${dirname}/.venv/bin/python ${dirname}/pico-send.py
Restart=always

[Install]
WantedBy=multi-user.target
' | sudo tee /etc/systemd/system/pico-send.service

sudo systemctl enable pico-send --now
