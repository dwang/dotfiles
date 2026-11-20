#!/bin/sh

set -eu

brewfile="private_dot_config/homebrew/Brewfile"
status=0

check_section() {
  kind="$1"
  names="$(awk -v kind="$kind" '$1 == kind { gsub(/"/, "", $2); print $2 }' "$brewfile")"

  if ! printf '%s\n' "$names" | LC_ALL=C sort -c 2>/dev/null; then
    printf "%ss must be alphabetized\n" "$kind" >&2
    status=1
  fi

  if [ "$(printf '%s\n' "$names" | LC_ALL=C sort | wc -l)" -ne "$(printf '%s\n' "$names" | LC_ALL=C sort -u | wc -l)" ]; then
    printf "%ss contain duplicates\n" "$kind" >&2
    status=1
  fi
}

if ! awk '
  NF == 0 || /^#/ { next }
  $1 == "brew" && seen_cask { exit 1 }
  $1 == "cask" { seen_cask = 1 }
  $1 != "brew" && $1 != "cask" { exit 1 }
  NF != 2 || $2 !~ /^"[^"]+"$/ { exit 1 }
' "$brewfile"; then
  printf "Brewfile must contain only brew entries followed by cask entries\n" >&2
  status=1
fi

check_section brew
check_section cask

exit "$status"
