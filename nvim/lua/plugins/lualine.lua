return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local icons = LazyVim.config.icons
    local mocha = require("catppuccin.palettes").get_palette("mocha")

    local cat_mocha = {
      normal = {
        a = { fg = mocha.base, bg = mocha.sky, gui = "bold,italic" },
        b = { fg = mocha.sky, bg = mocha.base },
        c = { fg = mocha.subtext0, bg = mocha.base },
      },
      insert = {
        a = { fg = mocha.base, bg = mocha.pink, gui = "bold,italic" },
        b = { fg = mocha.pink, bg = mocha.base },
      },
      visual = {
        a = { fg = mocha.base, bg = mocha.mauve, gui = "bold,italic" },
        b = { fg = mocha.mauve, bg = mocha.base },
      },
      replace = {
        a = { fg = mocha.base, bg = mocha.green, gui = "bold,italic" },
        b = { fg = mocha.green, bg = mocha.base },
      },
      command = {
        a = { fg = mocha.base, bg = mocha.peach, gui = "bold,italic" },
        b = { fg = mocha.peach, bg = mocha.base },
      },
    }

    opts = {
      options = {
        always_divide_middle = true,
        theme = cat_mocha,
        section_separators = { left = "", right = "" },
        component_separators = { left = " ", right = "" },
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
          winbar = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icon_enabled = true,
            icon = "",
            fmt = function(str)
              return str:sub(1, 1):upper() .. str:sub(2):lower()
            end,
          },
        },
        lualine_b = {
          {
            "branch",
            icon = "󰘬",
          },
        },

        lualine_c = {
          {
            "diff",
            symbols = {
              added = "+",
              modified = "~",
              removed = "-",
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_x = {
          Snacks.profiler.status(),
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.mode.has()
            end,
            color = function()
              return { fg = Snacks.util.color("Constant") }
            end,
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
        },
        lualine_y = {
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          {
            "filename",
          },
        },
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }
    return opts
  end,
}
