typeset -U path PATH
path=(
  /opt/homebrew/opt/llvm/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  "$XDG_BIN_HOME"
  "$XDG_DATA_HOME/nvim/mason/bin"
  "$BUN_INSTALL/bin"
  "$NPM_CONFIG_PREFIX/bin"
  "$GOPATH/bin"
  /opt/homebrew/opt/rustup/bin
  "$CARGO_HOME/bin"
  $path
  /Applications/Obsidian.app/Contents/MacOS
)
export PATH
