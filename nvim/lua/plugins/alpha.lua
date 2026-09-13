return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        enabled = false,
      },
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
                       ,,                            ,,                    
`7MMF'                 db                            db                    
  MM                                                                       
  MM         ,6"Yb.  `7MM  `7MMpMMMb.  `7MMpMMMb.  `7MM   ,6"Yb.`7M'   `MF'
  MM        8)   MM    MM    MM    MM    MM    MM    MM  8)   MM  VA   ,V  
  MM      ,  ,pm9MM    MM    MM    MM    MM    MM    MM   ,pm9MM   VA ,V   
  MM     ,M 8M   MM    MM    MM    MM    MM    MM    MM  8M   MM    VVV    
.JMMmmmmMMM `Moo9^Yo..JMML..JMML  JMML..JMML  JMML..JMML.`Moo9^Yo.  ,V     
                                                                   ,V      
                                                                OOb"       
]]

      logo = string.rep("\n", 2) .. logo .. ""

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find File", "<cmd> lua LazyVim.pick()() <cr>"),
        dashboard.button("n", " " .. " New File", [[<cmd> ene <BAR> startinsert <cr>]]),
        dashboard.button("r", " " .. " Recent Files", [[<cmd> lua LazyVim.pick("oldfiles")() <cr>]]),
        dashboard.button("g", " " .. " Find Text", [[<cmd> lua LazyVim.pick("live_grep")() <cr>]]),
        dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
      }

      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end

      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.section.footer.val = "It all return to Nothing"

      return dashboard
    end,
    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)
    end,
  },
}
