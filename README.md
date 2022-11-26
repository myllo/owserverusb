# OWServerUSB

|   |   |   |   |   |
| - | - | - | - | - |


WARNING! This a first blunder to get mneundorfer built OneWire/OWFS to work under Home Assistant as an add-on and to use a USB hub (DS9490R). 

I could not find any add-on to Home Assistant to do this (there are some which use IC2 or GPIO, of which I am not useing here), so I was left with option to try to modify one for myself or to accept that while using owserver as a separate container outside Home Assistant the Home Assistant could not be updated anymore.)

If you are not using Home Assistant, do not use this, but look instead to work done by mneundorfer ( https://github.com/mneundorfer/owserver ). That works (with correct owfs.conf settings) with a USB hub, as a separate docker container, something Home Assistant policies do not accept. 

As of 26 Nov:

THIS DOES NOT WORK YET AS INTENDED, BUT IS A WORK IN PROGRESS. DO NOT TRY TO USE THIS, WON'T WORK.

The instructions below are the same as on the page https://github.com/mneundorfer/owserver , as no modifications to instructions itself have been made yet. The instructions do not work under Home Assistant. 

By the way, I raise my hat to mneundorfer for having his values in proper order. Take a look at his avatar photo (22 Nov 2022). What he is carrying is the most precious thing in the world.

-----

This image includes an `owserver` and `owhttpd` installation for using [OneWire/OWFS](http://owfs.org/).

## Usage

### Default Config
Basic execution using USB OneWire device like DS9490R.
```bash
docker run -it --name owfs --device /dev/bus/usb -p 2122:2121 -d mneundorfer/owserver:latest
```
#### Docker-Compose
Build on your own container and run as docker-compose service. Config could be changed to use e.g. I2C devices.

```bash
git clone https://github.com/mneundorfer/owserver
cd owserver
docker-compose up
```

### Custom OWFS Config

```bash
docker run -it --name owfs --device /dev/bus/usb -v `pwd`/owfs.conf:/etc/owfs.conf:ro -p 2122:2121 -d mneundorfer/owserver:latest
```

### Enable FUSE Inside Container

Mounting the sensors via `owfs -m` requires appropriate privileges, adding `--device /dev/fuse --cap-add SYS_ADMIN --security-opt apparmor:unconfined` should do the trick. But be aware of the security implications (see  https://stackoverflow.com/a/49021109/1110628)!

```bash
docker run -it --name owfs --device /dev/bus/usb --device /dev/fuse --cap-add SYS_ADMIN --security-opt apparmor:unconfined -p 2122:2121 -d mneundorfer/owserver:latest
```
