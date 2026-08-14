-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.mouse = "nv"

if vim.g.neovide then
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_trail_size = 0.2
  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  vim.g.neovide_floating_corner_radius = 0.3
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 8.0
  vim.g.neovide_floating_blur_amount_y = 8.0
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_refresh_rate = 60
end

vim.opt_local.spell = false
