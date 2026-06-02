return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["<C-l>"] = "actions.select",
      ["<C-h>"] = { "actions.parent", mode = "n" },
      ["q"] = { "actions.close", mode = "n" },
      ["<C-\\>"] = { "actions.cd", opts = { scope = "tab" } },
      ["r"] = "actions.refresh",
    },
    use_default_keymaps = false,
    float = {
      win_options = {
        winblend = 30,
      },
      get_win_title = function()
        return "Oil"
      end,
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        local hidden_list = {
          [".DS_Store"] = true,
          ["__pycache__"] = true,
          [".ruff_cache"] = true,
          [".xmake"] = true,
          [".npm"] = true,
          [".CFUserTextEncoding"] = true,
          [".obsidian-cli.sock"] = true,
          [".vscode"] = true,
          [".vecode-share"] = true,
        }
        if hidden_list[name] then
          return true
        end
        return false
      end,
    },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  keys = {
    { "<leader>e", mode = { "n", "v" }, "<cmd>Oil --float<cr>", desc = "Open explorer" },
  },
  lazy = false,
}
