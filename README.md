![CI build](https://github.com/ambianic/ambianic-rpi-image/workflows/CI%20build/badge.svg?branch=main)
[![GitHub release (latest by date)](https://badgen.net/github/release/ambianic/ambianic-rpi-image?label=Version)](https://github.com/ambianic/ambianic-rpi-image/releases/latest)


# Ambianic Edge - Raspberry Pi Image

This project provides a binary image for Raspberry Pi with [Ambianic Edge](https://github.com/ambianic/ambianic-edge) pre-installed. The released image files are ready to be flashed on to an SD card and plugged into an rpi. When the raspberry pi boots for the first time with the new image on its SD Card, it runs a WiFi captive portal that allows the user to connect to it and setup WiFi access for the rpi. Once the rpi connects to the internet it is ready to be accessed and managed by the Ambianic UI PWA.

* Tested on Raspberry Pi 4 B
* Built on Raspberry Os Lite (no desktop) via [pi-gen](https://github.com/RPi-Distro/pi-gen). 
* Simple WiFi Setup via [Balena Wifi Connect](https://github.com/balena-io/wifi-connect)
* Visual configuration and management via [Ambianic UI](https://github.com/ambianic/ambianic-ui)

This image automatically and continuously updates to the latest version of Ambianic Edge using [docker watchtower](https://github.com/containrrr/watchtower).

The Ambianic Edge service is installed using the method described in the [Quick Start Guide](https://docs.ambianic.ai/users/quickstart/).

## Flash to SD Card

The easiest way to flash the *Ambianic Edge Raspberry Pi Image* to your SD card is to use [Etcher](https://www.balena.io/etcher/).
  
<p align="center">
    <img src="https://user-images.githubusercontent.com/3979615/74733445-789cac00-52a0-11ea-9167-05b42d6383ad.gif" width="600">
</p>

1. Download and install the latest version of [Etcher](https://www.balena.io/etcher/).
2. Open Etcher and select *Flash from URL* then point to the [latest Ambianic Edge Raspberry Pi image](https://github.com/ambianic/ambianic-rpi-image/releases/latest/download/image_ambianic_edge-rpi.zip). There is no need to download the image first.
3. Choose the drive your SD card has been inserted into.
4. Click Flash.

## First Boot / Network Setup

Now that you have flashed your SD card, you can insert it into your Raspberry Pi.

### WiFi Setup

![wifi-connect-setup](https://user-images.githubusercontent.com/3979615/75397237-7e525b80-594a-11ea-9be0-4f064b6a4178.png)

Follow these steps to connect your device to WiFi:

1. Power on your device without an Ethernet cable attached.
2. Wait 1-2 minutes
3. Use your mobile phone to scan for new WiFi networks
4. Connect to the hotspot named **Ambianic Edge WiFi Setup**. 
5. Wait a few moments until the captive portal opens, this portal will allow you to connect the Raspberry Pi to your local WiFi network.

If you enter your WiFi credentials incorrectly the **Ambianic Edge WiFi Setup** hotspot will reappear allowing you to try again.

You should see screens similar to the ones below.

<p align="left">
    <img src="https://user-images.githubusercontent.com/2234901/99506621-f1bc5300-2947-11eb-89eb-952e8e582d3a.png" height="400">
    <img src="https://user-images.githubusercontent.com/2234901/99506633-f41ead00-2947-11eb-9bba-a61f2b2724cf.png" height="400">
</p>

### Ambianic UI connection

Once the WiFi connection is established, the Raspberry Pi will pull the latest Ambianic Edge binaries. This may take 30-60 minutes based on your internet connection speed. By default the device is configured to use a Raspberry Pi Camera as input source and report person detection events.

After the update process is completed, you can proceed to pair the edge device with your [Ambianic UI](https://ui.ambianic.ai) app. The detailed steps to pair Ambianic UI to Ambianic Edge are [described here](https://docs.ambianic.ai/users/quickstart/#pairing-ambanic-ui-with-ambianic-edge).


# Other notes

The awesome [Homebridge](https://github.com/homebridge/homebridge-raspbian-image) project provided inspiration and reference code for the method chosen to build the Ambianic Edge Raspberry Pi image.

A new Ambianic Edge rpi image is released about once a year to keep up with underlying OS file dependencies. 

The Ambianic Edge rpi image **is not** updated each time a new version of the Ambianic Edge software is released. Instead the rpi image uses docker to run the ambianic-edge application software and it automatically updates the docker images using docker watchtower when they are released. This greatly reduces the need for manual maintenance of Ambianic Edge devices.

The targeted lifespan of an Ambianic Edge image is 4-5 years. Once an Ambianic Edge device is up and running, it should not require manual intervention for software updates throughout its target lifespan of 4-5 years. 

# Project Status

An early stage Alpha version is now avaiable for testing.

Roadmap:
- [x] Create [pi-gen](https://github.com/RPi-Distro/pi-gen) script for RPI OS Lite image
- [x] Add custom pi-gen stage with [Wifi Connect](https://github.com/balena-io/wifi-connect#installation) install
- [x] Add custom pi-gen stage with Docker & Docker Compose install
- [x] Push rpi image release on github
- [x] Document image install process on a new rpi system
- [ ] Install [watchtower](https://github.com/containrrr/watchtower) docker image install
- [ ] Install [ambianic-edge](https://docs.ambianic.ai/users/quickstart/) docker image install
- [ ] Update Quickstart to include rpi fast tack section.
- [ ] Schedule annual rpi image release automation
 
