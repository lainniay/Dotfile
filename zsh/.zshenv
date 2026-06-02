
# XDG Base Directory Standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# ==========================================
# 2. Environment Variables & Paths (RUST/GO/ETC)
# ==========================================

export EDITOR=nvim

# homebrew 
export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSTALL_CLEANUP=0
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_UPDATE_REPORT_NEW=1

# llvm 
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$CARGO_HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/rustup/bin:$CARGO_HOME/bin:$PATH"

# Go
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Node
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

# BUN
export BUN_INSTALL="$XDG_DATA_HOME/bun"
export PATH="$BUN_INSTALL/bin:$PATH" 

# Obsidian
export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"

# Mason 
export PATH="$XDG_DATA_HOME/nvim/mason/bin:${PATH}"

# XMake 
export XMAKE_GLOBALDIR="$XDG_CONFIG_HOME/xmake"

# Codex
export CODEX_HOME="$XDG_CONFIG_HOME/codex"

# Claude 
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"

# Matplotlib
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"

# Ruff 
export RUFF_CACHE_DIR="$XDG_CACHE_HOME/ruff"

# eza 
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"
export EZA_ICON_SPACING=2
