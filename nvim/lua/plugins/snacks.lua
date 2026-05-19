return {
  "snacks.nvim",
  opts = {
    terminal = {
      win = {
        position = "float",
      },
      wo = {
        winblend = 10,
      },
    },
    float = {
      wo = {
        winblend = 30,
      },
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
      wo = {
        winblend = 30,
      },
    },
    notification_history = {
      win = {
        position = "float",
      },
    },
    styles = {
      float = {
        wo = {
          winblend = 30,
        },
      },
      terminal = {
        wo = { winblend = 30 },
      },
      lazygit = {
        wo = { winblend = 30 },
      },
      notification = {
        wo = { winblend = 30 },
      },
      notification_history = {
        wo = { winblend = 30 },
      },
      scratch = {
        wo = { winblend = 30 },
      },
    },
  },
}
