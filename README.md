# Pico Oled 1.2 Display

This is a simple project to display information on the Waveshare Pico 1.3 inch OLED display using a Raspberry Pi Pico.

There are two parts.

- A python program that runs on the Pico to drive the display. It will display text sent to it over the USB serial connection.
- A host program that runs on a PC (Linux, Mac or Windows) that sends text to the Pico over USB serial.

The current example host program displays the MAC address of the host computer on the Pico display. This is a useful service for commissioning a headless Raspberry Pi for example.

