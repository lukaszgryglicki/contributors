#!/bin/bash
cd /usr/share/grafana.contrib
grafana-server -config /etc/grafana.contrib/grafana.ini cfg:default.paths.data=/var/lib/grafana.contrib 1>/var/log/grafana.contrib.log 2>&1
