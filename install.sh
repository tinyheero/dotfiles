#!/usr/bin/env bash

ln_exec="ln"
case "${OSTYPE}" in
  darwin*)
    # Commands for macOS (Darwin)
    echo "Configuring for macOS..."
    export PATH="/opt/homebrew/bin:$PATH"
    ln_exec="gln"
    ;;
  linux*)
    # Commands for Linux
    echo "Configuring for Linux..."
    export PATH="${HOME}/usr/bin:$PATH"
    ;;
  *)
    # Commands for any other OS
    echo "Unknown OS: ${OSTYPE}. Using generic configuration."
    ;;
esac



# Install zsh plugins =========================================================
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


# Install NvChad =========================================================
nvchad_dir="${HOME}/.config/nvim"
if [[ ! -d "${nvchad_dir}" ]]; then
    git clone https://github.com/NvChad/starter ${nvchad_dir}
    declare -a nvchad_files=(
        "init.lua"
        "lua/autocmds.lua"
        "lua/chadrc.lua"
        "lua/mappings.lua"
        "lua/options.lua"
        "lua/configs/nvim-treesitter.lua"
        "lua/plugins/avante.lua"
    )
    for file in "${nvchad_files[@]}"; do
        # --force is needed since the cloning of adds some of the file 
        # beforehand
        ${ln_exec} -rs --force "nvchad/${file}" "${nvchad_dir}/${file}"
    done
fi
