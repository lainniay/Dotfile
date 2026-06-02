return {
  "nvimdev/dashboard-nvim",
  lazy = true, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  enabled = false,
  event = "VimEnter",
  opts = function()
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

    logo = string.rep("\n", 6) .. logo .. "\n\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          {
            action = "lua LazyVim.pick()()",
            desc = " Find File",
            icon = " ",
            key = "f",
          },
          {
            action = "ene | startinsert",
            desc = " New File",
            icon = " ",
            key = "n",
          },
          {
            action = 'lua LazyVim.pick("oldfiles")()',
            desc = " Recent Files",
            icon = " ",
            key = "r",
          },
          {
            action = 'lua LazyVim.pick("live_grep")()',
            desc = " Find Text",
            icon = " ",
            key = "g",
          },
          {
            action = 'lua require("persistence").load()',
            desc = " Restore Session",
            icon = " ",
            key = "s",
          },
          {
            action = function()
              vim.api.nvim_input("<cmd>qa<cr>")
            end,
            desc = " Quit",
            icon = " ",
            key = "q",
          },
        },
        footer = function()
          return { "It all return to Nothing" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 50 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
