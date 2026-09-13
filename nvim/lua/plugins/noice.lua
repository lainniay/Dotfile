local winblend = 25

local transparent_float = {
  winblend = winblend,
  winhighlight = {
    Normal = "NormalFloat",
    FloatBorder = "FloatBorder",
  },
}

return {
  "folke/noice.nvim",
  opts = {
    messages = {
      view_history = "popup",
    },
    commands = {
      history = { view = "popup" },
      all = { view = "popup" },
    },
    views = {
      cmdline_popup = {
        win_options = transparent_float,
      },
      popupmenu = {
        win_options = transparent_float,
      },
      popup = {
        win_options = transparent_float,
      },
      hover = {
        border = { style = "rounded" },
        win_options = transparent_float,
      },
      confirm = {
        win_options = transparent_float,
      },
      mini = {
        win_options = transparent_float,
      },
      cmdline_output = {
        view = "popup",
      },
      messages = {
        view = "popup",
      },
    },
  },
}
