ZIM_CONFIG_FILE="${ZDOTDIR:-${HOME}}/zimrc"
ZIM_HOME="${ZDOTDIR:-${HOME}}/zim"
if [[ ! "${ZIM_HOME}/init.zsh" -nt "${ZIM_CONFIG_FILE}" ]]; then
  source /opt/homebrew/opt/zimfw/share/zimfw.zsh init
fi
source "${ZIM_HOME}/init.zsh"
