alias clr="clang++ -std=c++23 -O3 -march=native"
alias cld="clang++ -std=c++23 -Wall -g -Wextra -Wpedantic"
alias cl="clang++"

alias th="trash"

function neo() {
    neovide "$@" </dev/null >|/tmp/neovide.log 2>&1 &!
}

compdef _ls neo


unalias l 2>/dev/null
function l() {
  eza -a -l --icons --git --no-time -b  --group-directories-first \
      --no-symlinks \
      --ignore-glob=".gemini|.DS_Store|.CFUserTextEncoding|.vscode*|.ssh|.obsidian-cli.sock|.npm|.agents" \
      "$@"
}

function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    local cwd="$(<"$tmp")"
    if [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

unalias m 2>/dev/null
function m() {
  mark=$PWD; echo "Marked: $mark";
}

unalias b 2>/dev/null
function b() {
  cd "$mark"
}


