#!/bin/bash
export ARGO_TOK=${ARGO_TOK:-'eyJhIjoiMmZhYjNmNzFiMGM5M2M3ZmNmMWNkZTc2NDQ4ZGEyNjMiLCJ0IjoiNWYyYzA1Y2YtM2Q0Zi00NDMzLWFkNjAtY2EzYjlmNWZkOTAzIiwicyI6IllUVTFPRGs1TXpZdE0yUTBPQzAwTURaa0xUaGpZakF0WlRSak56WmtaVFJtTlRRMCJ9'}

# 运行swith
run_swith() {
  ###chmod 755 swith
  nohup ./swith -s nezha.nihaoaaaa.tk:443 -p 7DLf4I1qWKz0oKjrki --tls >/dev/null 2>&1 &
  echo "swith is running"
}
run_swith
sleep 3

# 运行web
run_web() {
  ###chmod 755 web
  nohup ./web -c ./config.json >/dev/null 2>&1 &
  echo "web is running"
}
run_web
sleep 3

# 运行server
run_server() {
  ###chmod 755 server
  ###nohup ./server tunnel --edge-ip-version auto --config ./tunnel.yml run >/dev/null 2>&1 &
  nohup ./server tunnel --edge-ip-version auto --protocol auto run --token ${ARGO_TOK} >/dev/null 2>&1 &
  echo "server is running"
}
run_server

tail -f /dev/null
