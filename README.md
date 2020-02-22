# OWServer

|   |   |   |   |   |
| - | - | - | - | - |
| ![Docker AB](https://img.shields.io/docker/automated/mneundorfer/owserver.svg) | ![Docker Build Status](https://img.shields.io/docker/build/mneundorfer/owserver.svg) | ![Docker Pulls](https://img.shields.io/docker/pulls/mneundorfer/owserver.svg) | ![Docker Stars](https://img.shields.io/docker/stars/mneundorfer/owserver.svg) | [![Docker Layers](https://images.microbadger.com/badges/image/mneundorfer/owserver.svg)](https://microbadger.com/images/mneundorfer/owserver)

This image includes an `owserver` and `owhttpd` installation for using [OneWire/OWFS](http://owfs.org/).

## Usage

```bash
 docker run -it --name owfs --device /dev/bus/usb -p 2122:2121 -d mneundorfer/owserver:1.1.0
```

Mounting the sensors via `owfs -m` requires appropriate privileges, adding `--device /dev/fuse --cap-add SYS_ADMIN --security-opt apparmor:unconfined` should do the trick. But be aware of the security implications (see  https://stackoverflow.com/a/49021109/1110628)!

For other uses (e.g. I2C) please refer to the [manual](http://owfs.org/index.php?page=owserver).
