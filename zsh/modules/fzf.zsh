export FZF_DEFAULT_OPTS=" \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

zstyle ':fzf-tab:*' use-fzf-default-opts yes

zstyle ':completion:*' ignored-patterns \
  '.omo' \
  '.omo/' \
  '*/.omo' \
  '*/.omo/' \
  '.obsidian-cli.sock' \
  '*/.obsidian-cli.sock' \
  '.DS_Store' \
  '*/.DS_Store' \
  '.CFUserTextEncoding' \
  '*/.CFUserTextEncoding' \
  '.context7' \
  '.context7/' \
  '*/.context7' \
  '*/.context7/' \
