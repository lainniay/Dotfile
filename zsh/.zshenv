
# XDG Base Directory Standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_BIN_HOME="$HOME/.local/bin"

# Environment variables

export EDITOR=nvim

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_UPDATE_REPORT_NEW=1

# LLVM
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Go
export GOPATH="$XDG_DATA_HOME/go"

# Node
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

# BUN
export BUN_INSTALL="$XDG_DATA_HOME/bun"

# Haskell
export GHCUP_USE_XDG_DIRS=1

# XMake 
export XMAKE_GLOBALDIR="$XDG_CONFIG_HOME/xmake"

# Codex
export CODEX_HOME="$XDG_CONFIG_HOME/codex"
export CODEX_SQLITE_HOME="$XDG_STATE_HOME/codex/sqlite"

# Claude 
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"
export CLAUDE_CODE_TMPDIR="$XDG_CACHE_HOME/claude"

# Matplotlib
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"

# Ruff 
export RUFF_CACHE_DIR="$XDG_CACHE_HOME/ruff"

# eza 
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"
export EZA_ICON_SPACING=2

# opencode 
export OPENCODE_EXPERIMENTAL_BACKGROUND_SUBAGENTS=true

export PI_CODING_AGENT_DIR="$XDG_CONFIG_HOME/pi"
export PI_CODING_AGENT_SESSION_DIR="$XDG_STATE_HOME/pi/sessions"


