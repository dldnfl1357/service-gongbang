#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-all}"
REPO_URL="${SERVICE_GONGBANG_REPO:-${MICROFOUNDRY_REPO:-https://github.com/dldnfl1357/service-gongbang.git}}"
REF="${SERVICE_GONGBANG_REF:-${MICROFOUNDRY_REF:-main}}"
INSTALL_DIR="${SERVICE_GONGBANG_HOME:-${MICROFOUNDRY_HOME:-$HOME/.service-gongbang}}"

usage() {
  cat >&2 <<'EOF'
usage: install.sh [all|claude|codex|gemini|cli]

Environment overrides:
  SERVICE_GONGBANG_REPO   Git URL to clone
  SERVICE_GONGBANG_REF    Branch, tag, or commit to install
  SERVICE_GONGBANG_HOME   Local checkout path
EOF
}

need_git() {
  if ! command -v git >/dev/null 2>&1; then
    echo "error: git is required to install 서비스공방" >&2
    exit 1
  fi
}

is_repo_root() {
  [ -d "$1/skills" ] && [ -x "$1/scripts/install.sh" ] && [ -f "$1/gemini-extension.json" ]
}

resolve_root() {
  local cwd
  cwd="$(pwd)"

  if is_repo_root "$cwd"; then
    printf '%s\n' "$cwd"
    return
  fi

  need_git
  mkdir -p "$(dirname "$INSTALL_DIR")"

  if [ -d "$INSTALL_DIR/.git" ]; then
    echo "Updating $INSTALL_DIR" >&2
    git -C "$INSTALL_DIR" fetch --quiet origin "$REF"
    git -C "$INSTALL_DIR" checkout --quiet "$REF" 2>/dev/null || git -C "$INSTALL_DIR" checkout --quiet FETCH_HEAD
    git -C "$INSTALL_DIR" pull --ff-only --quiet origin "$REF" 2>/dev/null || true
  elif [ -e "$INSTALL_DIR" ]; then
    echo "error: $INSTALL_DIR exists but is not a git checkout" >&2
    echo "Set MICROFOUNDRY_HOME to another path, or move the existing directory." >&2
    exit 1
  else
    echo "Cloning $REPO_URL into $INSTALL_DIR" >&2
    git clone --quiet --branch "$REF" "$REPO_URL" "$INSTALL_DIR"
  fi

  if ! is_repo_root "$INSTALL_DIR"; then
    echo "error: $INSTALL_DIR does not look like a 서비스공방 checkout" >&2
    exit 1
  fi

  printf '%s\n' "$INSTALL_DIR"
}

case "$TARGET" in
  all|claude|codex|gemini|cli) ;;
  *)
    usage
    exit 2
    ;;
esac

ROOT="$(resolve_root)"
exec "$ROOT/scripts/install.sh" "$TARGET"
