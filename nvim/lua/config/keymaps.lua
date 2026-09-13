-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

for _, lhs in ipairs({
  "<leader>ft",
  "<leader>fT",
  "<leader>gg",
  "<leader>gG",
}) do
  pcall(vim.keymap.del, "n", lhs)
end

for _, lhs in ipairs({
  "<C-/>",
  "<C-_>",
}) do
  pcall(vim.keymap.del, { "n", "t" }, lhs)
end
