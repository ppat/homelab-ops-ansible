#!/bin/bash
set -euo pipefail

fetch_image() {
  local url=$1
  local output_file=$2
  local timeout=$3
  local retries=$4

  wget \
    -nv \
    --tries=$retries \
    --connect-timeout=10 \
    --dns-timeout=5 \
    --read-timeout=$timeout \
    --wait=5 \
    --no-dns-cache \
    --continue \
    -O ${output_file}.xz \
    $url 
}

main() {
  local url=$1
  local output_file=$2
  local timeout=$3
  local retries=$4

  echo "Fetching image from $url..."
  fetch_image $url $output_file $timeout $retries

  echo "Unpacking image..."
  xz -d ${output_file}.xz

  echo "Done..."
}

OUTPUT_FILE=""
IMAGE_URL=""
TIMEOUT="5m"
RETRIES="5"

while [ $# -gt 0 ]; do
  case "$1" in
    --url)
      IMAGE_URL="$2"; shift
      ;;
    --output)
      OUTPUT_FILE="$2"; shift
      ;;
    --timeout)
      TIMEOUT="$2"; shift
      ;;
    --retries)
      RETRIES="$2"; shift
      ;;
    *)
      echo "Invalid parameter: ${1}"; echo; exit 1
  esac
  shift
done

if [[ -z "$IMAGE_URL" || -z "$OUTPUT_FILE" ]]; then
  echo "--url and --output are required."
  exit 1
fi

main ${IMAGE_URL:?} ${OUTPUT_FILE:?} ${TIMEOUT:?} ${RETRIES:?} 2>&1
