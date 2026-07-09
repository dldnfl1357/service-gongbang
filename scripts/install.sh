#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${1:-all}"

link_one() {
  local src="$1"
  local dest="$2"
  local name
  name="$(basename "$src")"
  mkdir -p "$dest"

  if [ -L "$dest/$name" ] && [ "$(readlink "$dest/$name")" = "$src" ]; then
    echo "ok: $dest/$name"
    return
  fi

  if [ -e "$dest/$name" ] || [ -L "$dest/$name" ]; then
    echo "skip: $dest/$name already exists"
    return
  fi

  ln -s "$src" "$dest/$name"
  echo "linked: $dest/$name"
}

install_skills_dir() {
  local dest="$1"
  local skill
  for skill in "$ROOT"/skills/*; do
    [ -d "$skill" ] || continue
    link_one "$skill" "$dest"
  done
}

install_claude() {
  install_skills_dir "$HOME/.claude/skills"
}

install_codex() {
  install_skills_dir "${CODEX_HOME:-$HOME/.codex}/skills"
}

install_gemini() {
  local dest="$HOME/.gemini/extensions"
  local name="service-gongbang"
  mkdir -p "$dest"

  if [ -L "$dest/$name" ] && [ "$(readlink "$dest/$name")" = "$ROOT" ]; then
    echo "ok: $dest/$name"
    return
  fi

  if [ -e "$dest/$name" ] || [ -L "$dest/$name" ]; then
    echo "skip: $dest/$name already exists"
    echo "hint: run 'gemini extensions link $ROOT' instead, or remove the existing extension manually"
    return
  fi

  ln -s "$ROOT" "$dest/$name"
  echo "linked: $dest/$name"
}

case "$TARGET" in
  all)
    install_claude
    install_codex
    install_gemini
    ;;
  claude)
    install_claude
    ;;
  codex)
    install_codex
    ;;
  gemini)
    install_gemini
    ;;
  *)
    echo "usage: $0 [all|claude|codex|gemini]" >&2
    exit 2
    ;;
esac
