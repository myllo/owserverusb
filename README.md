# OWServer

|   |   |   |   |   |
| - | - | - | - | - |
| ![Docker AB](https://img.shields.io/docker/automated/mneundorfer/owserver.svg) | ![Docker Build Status](https://img.shields.io/docker/build/mneundorfer/owserver.svg) | ![Docker Pulls](https://img.shields.io/docker/pulls/mneundorfer/owserver.svg) | ![Docker Stars](https://img.shields.io/docker/stars/mneundorfer/owserver.svg) | [![Docker Layers](https://images.microbadger.com/badges/image/mneundorfer/owserver.svg)](https://microbadger.com/images/mneundorfer/owserver)

This image includes an `owserver` installation for using [OneWire/OWFS](http://owfs.org/).

## Usage

To run a basic setup with a [DS9490R](http://owfs.org/index.php?page=usb-ds9490r) busmaster use the image as follows

```bash
docker run --name owserver --privileged -v /dev/bus/usb:/dev/bus/usb -p 4304:4304 -d mneundorfer/owserver -uall -uscan
```

This exposes the `owserver` on port `4304` to the outside world.

`--privileged` flag and `/dev/bus/usb` mount are [required for accessing the busmaster](https://stackoverflow.com/a/24231872).

For playing around/testing, you can attach fake devices

```bash
docker run --name owserver -p 4304:4304 -d mneundorfer/owserver --fake=DS18S20,DS2405
```

For other uses (e.g. I2C) please refer to the [manual](http://owfs.org/index.php?page=owserver).

## Further Usage

Please also find the [`owhttpd`](https://github.com/mneundorfer/owhttpd) image which plays together nicely with this.