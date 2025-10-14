#!/usr/bin/env bash

# Install zsh plugins 
declare -A plugins=(
  [zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
  [zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions"
)

for plugin in "${!plugins[@]}"; do
  plugin_dir="${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/${plugin}"
  if [[ ! -d ${plugin_dir} ]]; then
    echo "Installing ${plugin}..."
    git clone "${plugins[${plugin}]}" "${plugin_dir}"
  else
    echo "${plugin} is already installed."
  fi
done
