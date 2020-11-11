# Raspberry Pi Image for Ambianic Edge devices

This project is responsible for creating binary image files for Ambianic Edge devices running on Raspberry Pi. The released image files are ready to be flashed on to an SD card and plugged into an rpi. When the raspberry pi boots for the first time with the new image on its SD Card, it runs a WiFi captive portal that allows the user to connect to it and setup WiFi access for the rpi. Once the rpi connects to the internet it is ready to be accessed and managed by the Ambianic UI PWA.

A new Ambianic Edge rpi image is released about once a year to keep up with underlying OS file dependencies. 

The Ambianic Edge rpi image **is not** updated each time a new version of the Ambianic Edge software is released. Instead the rpi image uses docker to run the ambianic-edge application software and it automatically updates the docker images using docker watchtower when they are released. This greatly reduces the need for manual maintenance of Ambianic Edge devices.

The targeted lifespan of an Ambianic Edge image is 4-5 years. Once an Ambianic Edge device is up and running, it should not require manual intervention for software updates throughout its target lifespan of 4-5 years. 

# Project Status

Just getting started.

TODO:
- [x] Create pi-gen script for RPI OS Lite image
- [ ] Add custom pi-gen stage with Wifi connect install
- [ ] Add custom pi-gen stage with Docker & Docker compose install
- [ ] Add custom pi-gen stage with watchtower docker image install
- [ ] Add custom pi-gen stage with ambianic-edge docker image install
- [ ] Push rpi image release on github
- [ ] Schedule annual rpi image release automation
- [ ] Document image install process on a new rpi system
