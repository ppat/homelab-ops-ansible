#!/bin/bash
set -euo pipefail

SERVER_URL=""
NODE_TYPE="agent"
while [[ $# -gt 0 ]]; do
  case $1 in
    -u|--url)
      SERVER_URL="$2"
      shift
      ;;
    -t|--type)
      NODE_TYPE="$2"
      shift
      ;;
    *)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
  shift
done

# setting needed environment variables
export INSTALL_K3S_SKIP_DOWNLOAD=true
if [[ "$SERVER_URL" != "" ]]; then
  export K3S_URL="$SERVER_URL"
fi
if [[ "$NODE_TYPE" == "server" ]]; then
  # on server nodes, set both 'server-token' and 'agent-token'
  export K3S_TOKEN_FILE=/tmp/k3s_token_server
  export K3S_AGENT_TOKEN_FILE=/tmp/k3s_token_agent
else
  # on agent nodes, only 'agent-token' needs to be set
  export K3S_TOKEN_FILE=/tmp/k3s_token_agent
fi

echo "Necessary parameters have been set via environment variables:"
env | sort | grep '^K3S_' | pr -t -o 4
echo "All remaining parameters should have been previously set via /etc/rancher/k3s/config.yaml file."
pr -t -o 4 /etc/rancher/k3s/config.yaml
echo

if [[ "${K3S_URL:=none}" == "none" && "$NODE_TYPE" == "server" ]]; then
  echo "init server node as new cluster"
  /bin/sh /root/k3s-install.sh -- server --cluster-init
elif [[ "${K3S_URL:=none}" != "none" && "$NODE_TYPE" == "server" ]]; then
  echo "init server node connecting to existing cluster: $K3S_URL"
  /bin/sh /root/k3s-install.sh -- server
else
  echo "init agent node connecting to existing cluster: $K3S_URL"
  /bin/sh /root/k3s-install.sh -- agent
fi

echo "adding marker file indicating the node has been initialized..."
touch /etc/rancher/k3s/status/k3s.$NODE_TYPE.initialized

echo "Done"
