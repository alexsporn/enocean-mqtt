# enocean-mqtt

[![GitHub](https://img.shields.io/github/license/alexsporn/enocean-mqtt.svg)](https://github.com/alexsporn/enocean-mqtt/blob/master/LICENSE)
![npm](https://img.shields.io/npm/v/enocean-mqtt.svg)
![npm](https://img.shields.io/npm/dt/enocean-mqtt.svg)

A simple way to bridge your EnOcean switches to MQTT.

This is based on my previous work connecting EnOcean switches to Homebridge with [homebridge-enocean](https://github.com/alexsporn/homebridge-enocean)

Currently only rocker switches PTM210 and PTM215 (in normal mode) are supported.
This corresponds to the EnOcean EEP F6-02-01.

To use this you need a USB300 or TCM310 module connected to your computer.

To use it add this to your `config.json`:

```code
{
  "port": "/dev/ttyUSB0",
  "mqtt": "mqtt://192.168.178.54:1883",
  "mqtt_username": "username",
  "mqtt_password": "password"
}
```