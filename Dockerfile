FROM debian:stretch
LABEL AUTHOR="Maximilian Neundorfer <mail@mneundorfer.de>"

RUN apt-get update && \
    apt-get install -y owserver

EXPOSE 4304

ENTRYPOINT [ "owserver" ]
CMD [ "--foreground" ]