return {
  "catppuccin/nvim",
  name = "catppuccin",

  opts = {
    flavour = "mocha",
    no_underline = true,
    term_colors = true,

    transparent_background = true,

    float = {
      transparent = true,
      solid = false,
    },

    custom_highlights = function(colors)
      return {
        AlphaHeader = { fg = colors.pink },
        AlphaButtons = { fg = colors.blue },
        AlphaShortcut = { fg = colors.blue },
        AlphaFooter = {
          fg = colors.overlay0,
          style = { "italic" },
        },

        Normal = { bg = colors.none },
        NormalNC = { bg = colors.none },
        NormalFloat = { bg = colors.none },

        FloatBorder = {
          fg = colors.overlay0,
          bg = colors.none,
          style = { "bold" },
        },

        SnacksPicker = { bg = colors.none },
        SnacksPickerInput = { bg = colors.none },

        SnacksPickerBorder = {
          fg = colors.overlay0,
          bg = colors.none,
        },

        SnacksPickerInputBorder = {
          link = "SnacksPickerBorder",
        },
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
