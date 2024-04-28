#!/bin/bash
set -exo pipefail

main() {
  local url=$1
  local output_file=$2

  wget --progress=dot:giga $url -O ${output_file}.xz
  xz -d ${output_file}.xz
}

OUTPUT_FILE=""
IMAGE_URL=""

while [ $# -gt 0 ]; do
  case "$1" in
    --url)
      IMAGE_URL="$2"; shift
      ;;
    --output)
      OUTPUT_FILE="$2"; shift
      ;;
    *)
      echo "Invalid parameter: ${1}"; echo; exit 1
  esac
  shift
done

if [[ -z "$IMAGE_URL" || -z "$OUTPUT_FILE" ]]; then
  echo "All parameters required (--url, --output)"
  exit 1
fi

main $IMAGE_URL $OUTPUT_FILE
