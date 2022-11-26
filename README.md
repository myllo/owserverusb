# OWServer

|   |   |   |   |   |
| - | - | - | - | - |
| ![Docker AB](https://img.shields.io/docker/automated/mneundorfer/owserver.svg) | ![Docker Build Status](https://img.shields.io/docker/build/mneundorfer/owserver.svg) | ![Docker Pulls](https://img.shields.io/docker/pulls/mneundorfer/owserver.svg) | ![Docker Stars](https://img.shields.io/docker/stars/mneundorfer/owserver.svg) | [![Docker Layers](https://images.microbadger.com/badges/image/mneundorfer/owserver.svg)](https://microbadger.com/images/mneundorfer/owserver)

WARNING! This a first blunder to get mneundorfer built OneWire/OWFS to work under Home Assistant as an add-on.

If you are not using Home Assistant, do not use this, but look instead to work done by mneundorfer ( https://github.com/mneundorfer/owserver )

As of 26 Nov, 2022, this is still the same as mneundorfer owserver, ie. not working yet (as add-on).

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
