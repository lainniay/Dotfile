return {
  {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    enabled = false,
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      {
        "<leader>e",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open explorer",
      },
      {
        "<leader>fe",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open explorer",
      },
      {
        "<leader>E",
        "<cmd>Yazi cwd<cr>",
        desc = "Open explorer in root",
      },
      {
        "<leader>fE",
        "<cmd>Yazi cwd<cr>",
        desc = "Open explorer in root",
      },
    },
    opts = {
      keymaps = {
        show_help = "<f1>",
      },
      yazi_floating_window_border = "none",
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
