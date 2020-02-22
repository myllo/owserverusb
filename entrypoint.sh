#!/bin/bash

service owserver start
service owhttpd start

tail -f /dev/null