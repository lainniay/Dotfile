return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = false,
  init = false,
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

    dashboard.section.header.val = vim.split(logo, "\n")
    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file",       "<cmd> lua LazyVim.pick()() <cr>"),
      dashboard.button("n", " " .. " New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
      dashboard.button("r", " " .. " Recent files",    [[<cmd> lua LazyVim.pick("oldfiles")() <cr>]]),
      dashboard.button("g", " " .. " Find text",       [[<cmd> lua LazyVim.pick("live_grep")() <cr>]]),
      dashboard.button("c", " " .. " Config",          "<cmd> lua LazyVim.pick.config_files()() <cr>"),
      dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
      dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
