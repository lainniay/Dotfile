ZOXIDE_CACHE="$HOME/.cache/zoxide_init.zsh"
if [[ ! -f "$ZOXIDE_CACHE" ]]; then
  zoxide init zsh > "$ZOXIDE_CACHE"
fi
source "$ZOXIDE_CACHE"
