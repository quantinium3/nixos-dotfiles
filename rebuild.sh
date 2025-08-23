#!/usr/bin/env bash

set -euo pipefail

sync_config() {
  local message="${1:-"update: sync config"}"
  echo "=== Syncing config to GitHub ==="
  git add -A
  if git diff --cached --quiet; then
    echo "No changes to commit."
  else
    git commit -m "$message"
  fi
  git push origin HEAD
}

rebuild_system() {
  echo "=== Rebuilding NixOS system ==="
  nh os switch . --hostname derivator
}

rebuild_home() {
  echo "=== Rebuilding Home Manager ==="
  home-manager switch --flake ~/.config/nix#derivator
}

rebuild_all() {
  sync_config "update: sync + rebuild"
  rebuild_system
  rebuild_home
}

usage() {
  cat <<EOF
Usage: $0 [command] [commit-message]

Commands:
  sync [msg]    Commit and push config changes to GitHub
  system        Rebuild NixOS system
  home          Rebuild Home Manager
  all [msg]     Sync config + rebuild system + rebuild home
EOF
}

main() {
  case "${1:-}" in
    sync)
      shift
      sync_config "$@"
      ;;
    system)
      rebuild_system
      ;;
    home)
      rebuild_home
      ;;
    all)
      shift
      rebuild_all "$@"
      ;;
    *)
      usage
      ;;
  esac
}

main "$@"
