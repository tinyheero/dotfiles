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
    ${ln_exec} -rs nvchad/init.lua ${nvchad_dir}/init.lua
    ${ln_exec} -rs nvchad/lua/autocmds.lua ${nvchad_dir}/lua/autocmds.lua
    ${ln_exec} -rs nvchad/lua/chadrc.lua ${nvchad_dir}/lua/chadrc.lua
    ${ln_exec} -rs nvchad/lua/mappings.lua ${nvchad_dir}/lua/mappings.lua
    ${ln_exec} -rs nvchad/lua/options.lua ${nvchad_dir}/lua/options.lua
    ${ln_exec} -rs nvchad/lua/configs/nvim-treesitter.lua ${nvchad_dir}/lua/configs/nvim-treesitter.lua
    ${ln_exec} -rs nvchad/lua/plugins/avante.lua ${nvchad_dir}/lua/plugins/avante.lua
fi
