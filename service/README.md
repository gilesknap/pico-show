A service to send the MAC address to a connected Raspberry Pi Pico via USB serial.

This service monitors for the connection of a Raspberry Pi Pico device via USB. When the device is connected, it sends the current MAC address of the host machine to the Pico over the serial port.

## Installation

Install `uv` if you haven't already:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

create a virtual environment and install dependencies:

```bash
git clone https://github.com/gilesknap/pico-show.git
cd pico-show/service
uv sync
```

Install the systemd service to point at the virtual environment and launch pico-send.py:

```bash
sudo ./install.sh
```

# Warning

The files in this directory should be protected from edit by non-privileged users, as they are executed by a system service with elevated privileges. The simplest way to do this is to set the ownership to root and the permissions to 755:

```bash
cd pico-show/service
sudo chown -R root:root .
sudo chmod -R 755 .
```

