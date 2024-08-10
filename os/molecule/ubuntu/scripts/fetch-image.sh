#!/bin/bash
set -euo pipefail

fetch_image() {
  local url=$1
  local output_file=$2
  local timeout=$3

  local attempt=0
  local retries=3

  while [ $attempt -lt $retries ]; do
    echo "Attempt $attempt"
    rm -f ${output_file}.xz
    set +e
    /usr/bin/timeout --verbose $timeout wget -nv $url -O ${output_file}.xz
    exit_code=$?
    set -e
    if [[ $exit_code -eq 0 ]]; then
      echo "  Success"
      return 0
    elif [[ $exit_code -eq 124 ]]; then
      echo "  Timed out"
      attempt=$(( attempt + 1 ))
    else
      echo "  Failed"
      exit $exit_code
    fi
  done
}

main() {
  local url=$1
  local output_file=$2
  local timeout=$3

  echo "Fetching image from $url..."
  fetch_image $url $output_file $timeout

  echo "Unpacking image..."
  xz -d ${output_file}.xz

  echo "Done..."
}

OUTPUT_FILE=""
IMAGE_URL=""
TIMEOUT="5m"

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
    *)
      echo "Invalid parameter: ${1}"; echo; exit 1
  esac
  shift
done

if [[ -z "$IMAGE_URL" || -z "$OUTPUT_FILE" ]]; then
  echo "--url and --output are required."
  exit 1
fi

main ${IMAGE_URL:?} ${OUTPUT_FILE:?} ${TIMEOUT:?} 2>&1
