#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/scripts/helpers.sh"

set -e

tmux_options=(
  "\#{ct_current}"
  "\#{ct_max}"
  "\#{ct_info}"
)
tmux_scripts=(
  "#($CURRENT_DIR/scripts/ct_current.sh)"
  "#($CURRENT_DIR/scripts/ct_max.sh)"
  "#($CURRENT_DIR/scripts/ct_info.sh)"
)

do_interpolation() {
  local all_interpolated="$1"
  for ((i = 0; i < ${#tmux_options[@]}; i++)); do
    all_interpolated=${all_interpolated//${tmux_options[$i]}/${tmux_scripts[$i]}}
  done
  echo "$all_interpolated"
}

update_tmux_option() {
  local option
  local option_value
  local new_option_value
  option=$1
  option_value=$(get_tmux_option "$option")
  new_option_value=$(do_interpolation "$option_value")
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}
main
