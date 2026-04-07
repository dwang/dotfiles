#!/bin/sh

set -eu

packages_file=".chezmoidata/packages.yaml"
status=0

check_sorted() {
  section="$1"

  if [ "$(yq ".packages.${section} | join(\"\n\") == (sort | join(\"\n\"))" "$packages_file")" != "true" ]; then
    printf "%s must be alphabetized\n" "$section" >&2
    status=1
  fi
}

check_unique() {
  section="$1"

  if [ "$(yq "(.packages.${section} | length) == (.packages.${section} | unique | length)" "$packages_file")" != "true" ]; then
    printf "%s contains duplicates\n" "$section" >&2
    status=1
  fi
}

check_sorted brews
check_sorted casks
check_unique brews
check_unique casks

exit "$status"
