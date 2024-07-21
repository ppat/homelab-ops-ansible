#!/bin/bash
set -eo pipefail

SERVER_URL="-"
NODE_TYPE="agent"
PASSTHROUGH_ARGS=""

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
    --passthrough-args)
      PASSTHROUGH_ARGS="$2"
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
  local server_url="${2:?}"
  shift
  shift
  # shellcheck disable=SC2124
  local passthrough_args="$@"
  local result=""

  if [[ "$node_type" == "server" ]]; then
    if [[ "$server_url" == "-" ]]; then
      result="server --cluster-init"
    else
      result="server --server ${server_url:?}"
    fi
  elif [[ "$node_type" == "agent" ]]; then
    if [[ "$server_url" == "-" ]]; then
      >&2 echo "server url cannot be empty for agent node type"
      exit 1
    fi
    result="agent --server ${server_url:?}"
  else
    >&2 echo "invalid node type"
    exit 1
  fi
  result="${result:?} ${passthrough_args:?}"

  echo $result
}

echo "Determining installation parameters..."
PARAMS="$(determine_install_params "${NODE_TYPE}" "${SERVER_URL}" ${PASSTHROUGH_ARGS})"
echo "Determining installation environment variables..."
export INSTALL_K3S_SKIP_DOWNLOAD=true
if [[ "$NODE_TYPE" == "server" ]]; then
  export K3S_TOKEN="$(cat /tmp/k3s_token_server)"
  export K3S_AGENT_TOKEN="$(cat /tmp/k3s_token_agent)"
else
  export K3S_TOKEN="$(cat /tmp/k3s_token_agent)"
fi
echo "Using environment variables:"
env | sort | grep 'K3S' | cut -d'=' -f1 | sed -E 's|(.*)|    \1|g'
echo "Using commandline parameters:"
echo "    ${PARAMS}"
echo "All remaining parameters (from: /etc/rancher/k3s/config.yaml):"
pr -t -o 4 /etc/rancher/k3s/config.yaml
echo

set -x
/usr/bin/timeout --verbose 90s /bin/sh /root/k3s-install.sh ${PARAMS:?}
set +x
echo

echo "adding marker file indicating the node has been initialized..."
sudo mkdir -p /etc/rancher/k3s/status/
sudo touch /etc/rancher/k3s/status/k3s.$NODE_TYPE.initialized
echo "Done"
