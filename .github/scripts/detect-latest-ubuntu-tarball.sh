#!/bin/bash
set -euo pipefail


# Script to determine the latest Ubuntu LTS base image URL
# Uses the endoflife.date API to find the latest LTS version and its most recent patch release


main() {
    # Run the main function with the provided architecture or default to amd64
    local arch="${1:-amd64}"

    # Query the endoflife.date API for Ubuntu versions
    local api_data=$(curl -s "https://endoflife.date/api/ubuntu.json")

    # Find the latest LTS release: Get the cycle (version) of the latest LTS by sorting by release date
    local cycle=$(echo "$api_data" | jq -r '.[] | select(.lts == true) | [.releaseDate, .cycle] | @tsv' |
                 sort -r | head -1 | cut -f2)

    # Get full info for the latest LTS cycle
    local latest_lts=$(echo "$api_data" | jq -r ".[] | select(.cycle == \"$cycle\" and .lts == true)")

    # Extract the codename and latest patch version
    local codename=$(echo "$latest_lts" | jq -r '.codename' | awk '{print tolower($1)}')
    local latest_version=$(echo "$latest_lts" | jq -r '.latest')

    echo "Detected latest Ubuntu LTS: $cycle (codename: $codename, latest: $latest_version)" >&2

    # Construct the URL for the latest point release
    local base_url="https://cdimage.ubuntu.com/ubuntu-base/releases/${codename}/release"
    echo "${base_url}/ubuntu-base-${latest_version}-base-${arch}.tar.gz"
}

main "$@"
