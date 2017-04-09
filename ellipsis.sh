#!/usr/bin/env bash

pkg.link() {
  for configFile in "./atom"/*; do
    fs.link_file "./atom/$configFile" "$HOME/.atom/$configFile"
  done
}

pkg.install() {
  mkdir -p "$HOME/.atom"
  case $(os.platform) in
    osx)
      if utils.cmd_exists brew; then
        brew cask install atom
        apm stars --install
      fi
    ;;
  esac
}

pkg.pull() {
  git.pull && apm upgrade --no-confirm --no-color
}

