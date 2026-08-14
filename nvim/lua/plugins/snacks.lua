local winblend = 25

return {
  "snacks.nvim",

  ---@type snacks.Config
  opts = {
    picker = {
      icons = {
        diagnostics = {
          Error = "E ",
          Warn = "W ",
          Hint = "H ",
          Info = "I ",
        },
      },

      win = {
        input = {
          wo = {
            winblend = winblend,
          },
        },

        list = {
          wo = {
            winblend = winblend,
          },
        },

        preview = {
          wo = {
            winblend = winblend,
          },
        },
      },

      layout = {
        config = function(layout)
          layout.layout.backdrop = false
        end,
      },
    },

    styles = {
      float = {
        wo = {
          winblend = winblend,
        },
      },

      lazygit = {
        wo = {
          winblend = winblend,
        },
      },

      notification = {
        wo = {
          winblend = winblend,
        },
      },

      notification_history = {
        position = "float",
        wo = {
          winblend = winblend,
        },
      },

      scratch = {
        wo = {
          winblend = winblend,
        },
      },
    },
  },
}
