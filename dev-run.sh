#!/usr/bin/env bash

# build with `cargo build --verbose`

./target/debug/openethereum \
  --base-path /root/datadir/mordor \
  --chain=mordor \
  --no-ws \
  --no-discovery \
  --tracing=on \
  --pruning=archive \
  --network-id=7 \
  --ports-shift=10 \
  --jsonrpc-hosts=all \
  --jsonrpc-cors=all \
  --jsonrpc-interface=all \
  --jsonrpc-apis=all \
  --allow-ips=private \
  --max-peers=1 \
  --fat-db=on \
  --no-warp
  # --no-seal-check \
  # -l trace \

  # -l snapshot=trace \
  # -l devp2p=trace,network=trace \
  # --unsafe-expose \
  # --no-ipc \
  # --jsonrpc-hosts=all \
  # --jsonrpc-interface=all
  # --nat=none

# --nat extip:$(curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g')
#  > ./parity.log 2>&1
