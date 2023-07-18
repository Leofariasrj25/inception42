#!/bin/sh

cd /grafana-app/bin/
chmod +x grafana*
ls -l
exec ./grafana server --config inception.ini
