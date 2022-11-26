FROM debian:stable-slim
LABEL AUTHOR="myllo <tylsax@gmail.com>"
LABEL \
  io.hass.type="addon" \
  io.hass.arch="armhf|armv7|aarch64|amd64"

RUN apt-get update && \
    apt-get install -y owfs

RUN mkdir /mnt/1wire

COPY ./entrypoint.sh /
COPY ./owfs.conf /etc/

# The ports of owserver and owhttpd
EXPOSE 4304
EXPOSE 2121

CMD [ "/bin/bash", "entrypoint.sh" ]
