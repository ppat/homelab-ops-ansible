#!/bin/bash
set -eo pipefail

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

determine_install_params() {
  local node_type="${1:?}"
  local server_url="$2"
  local result=""

  if [[ "$node_type" == "server" ]]; then
    server_token_params="--token-file /tmp/k3s_token_server --agent-token-file /tmp/k3s_token_agent"
    if [[ "$server_url" == "" ]]; then
      result="server --cluster-init ${server_token_params}"
    else
      result="server --server ${server_url:?} ${server_token_params:?}"
    fi
  elif [[ "$node_type" == "agent" ]]; then
    agent_token_params="--token-file /tmp/k3s_token_agent"
    if [[ "$server_url" == "" ]]; then
      >&2 echo "server url cannot be empty for agent node type"
      exit 1
    fi
    result="agent --server ${server_url:?} ${agent_token_params:?}"
  else
    >&2 echo "invalid node type"
    exit 1
  fi

  echo $result
}

invoke_install_script() {
  local install_parameters="$(determine_install_params $NODE_TYPE $SERVER_URL)"
  echo "Using commandline parameters:"
  echo "    ${install_parameters}"
  echo "All remaining parameters (from: /etc/rancher/k3s/config.yaml):"
  pr -t -o 4 /etc/rancher/k3s/config.yaml
  echo

  export INSTALL_K3S_SKIP_DOWNLOAD=true
  /bin/sh /root/k3s-install.sh -- ${install_parameters:?}
  echo

  echo "adding marker file indicating the node has been initialized..."
  touch /etc/rancher/k3s/status/k3s.$NODE_TYPE.initialized
  echo "Done"
}

/usr/bin/timeout --verbose 90s invoke_install_script
