return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local config_dir = vim.fn.expand("~/.config")
    vim.env.XDG_CONFIG_HOME = config_dir
    vim.g.lazygit_use_custom_config_file_path = 1
    local config_yml = config_dir .. "/lazygit/config.yml"
    vim.g.lazygit_config_file_path = config_yml
  end,
}
