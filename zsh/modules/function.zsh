unalias l 2>/dev/null
function l() {
  local eza_args=(
    -l
    --icons
    --git
    --no-time
    -b
    --group-directories-first
    --ignore-glob=".DS_Store|Google Drive"
  )

  if [[ "$PWD" == "$HOME" ]]; then
    command eza "${eza_args[@]}" "$@"
  else
    command eza -a "${eza_args[@]}" "$@"
  fi
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

function neo() {
    neovide "$@" </dev/null >|/tmp/neovide.log 2>&1 &!
}
compdef _ls neo

function copyfile() {
  osascript -e 'on run argv' -e 'set the clipboard to POSIX file (item 1 of argv)' -e 'end run' "${1:A}"
}

unalias ccx 2>/dev/null
function ccx() {
  ANTHROPIC_BASE_URL=http://127.0.0.1:8317 \
  ANTHROPIC_AUTH_TOKEN=claudex_lainniay_miku_0831 \
  ANTHROPIC_MODEL=gpt-5.6-sol \
  CLAUDE_CODE_SUBAGENT_MODEL=gpt-5.6-sol \
  CLAUDE_CODE_ALWAYS_ENABLE_EFFORT=1 \
  CLAUDE_CODE_MAX_TOOL_USE_CONCURRENCY=3 \
  CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 \
  ENABLE_TOOL_SEARCH=false \
  claude --model gpt-5.6-sol "$@"
}

unalias oc 2>/dev/null
function oc() {
  if [[ "$PWD" == "$HOME" ]]; then
    echo "Do Not Use Opencode In Home Dir"
    return 1
  fi

  opencode "$@"
}
