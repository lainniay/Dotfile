return {
  "catppuccin/nvim",
  name = "catppuccin",

  opts = {
    flavour = "mocha",
    no_underline = true,
    -- transparent_background = true,
    term_colors = true,
    float = {
      transparent = true, -- enable transparent floating windows
    },

    custom_highlights = function(colors)
      return {
        DashboardHeader = { fg = colors.text },

        DashboardIcon = { fg = colors.text },

        DashboardDesc = { fg = colors.text },

        DashboardKey = { fg = colors.text },

        DashboardFooter = { fg = colors.overlay0, style = { "italic" } },
      }
    end,

    color_overrides = {
      mocha = {
        base = "#000000",
        mantle = "#000000",
        crust = "#000000",
      },
    },

    styles = {
      loops = {},
      keywords = {},
      booleans = {},
      types = {},
      strings = {},
      miscs = {},
      conditionals = {},
      comments = { "italic" },
    },
  },
}
