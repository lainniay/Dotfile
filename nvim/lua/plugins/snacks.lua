local winblend = 25

return {
  "snacks.nvim",

  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
    { "<leader>fe", false },
    { "<leader>fE", false },
  },

  opts = {
    explorer = {
      enabled = false,
    },

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
