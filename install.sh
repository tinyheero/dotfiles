#!/usr/bin/env bash

# Install zsh plugins 
declare -A plugins=(
  [conda-zsh-completion]="https://github.com/conda-incubator/conda-zsh-completion.git"
  [you-should-use]="https://github.com/MichaelAquilina/zsh-you-should-use.git"
  [zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions"
  [zsh-bat]="https://github.com/fdellwing/zsh-bat.git"
  [zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
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
