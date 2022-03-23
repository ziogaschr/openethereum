#!/usr/bin/env bash

export DOCKER_BUILDKIT=1

# Build openethereum
docker build -t ziogaschr/openethereum:v1 .

# Connect with bash
# docker run -it --rm --entrypoint /bin/bash ziogaschr/openethereum:v1
# docker run -it --rm ziogaschr/openethereum:v1 --help

# Run OpenEthereum
  # --network oe-network \
  # -p 8556:8556 \
  # -p 30313:30313 \
  # -p 30313:30313/udp \
docker run -ti --rm --name openethereum-tracer \
  -p 8555:8555 \
  -v "/Users/ziogaschr/Sites/etclabs/datadirs/openethereum.mordor.nowrap.archive":"/root/datadir" ziogaschr/openethereum:v1 \
  --base-path /root/datadir \
  --chain=mordor \
  --no-ws \
  --ports-shift=10 \
  --no-discovery \
  --tracing=on \
  --pruning=archive \
  --no-ipc \
  --unsafe-expose \
  --jsonrpc-hosts=all \
  --jsonrpc-interface=all
  # --nat=none

# --nat extip:$(curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g')
#  > ./parity.log 2>&1
