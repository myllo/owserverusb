# OWServer

This image includes an `owserver` installation for using [OneWire/OWFS](http://owfs.org/).

## Usage

To run a basic setup with a [DS9490R](http://owfs.org/index.php?page=usb-ds9490r) busmaster use the image as follows

```bash
docker run --name owserver --privileged -v /dev/bus/usb:/dev/bus/usb -p 4304:4304 -d mneundorfer/owserver -uall -uscan
```

This exposes the `owserver` on port `4304` to the outside world.

`--privileged` flag and `/dev/bus/usb` mount are [required for accessing the busmaster](https://stackoverflow.com/a/24231872).

For other uses please refer to the [manual](http://owfs.org/index.php?page=owserver).

## Further Usage

Please also find the [`owhttpd`](http://google.com) image which plays together nicely with this.