return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- 注意：如果你的 LazyVim 最新版启用了 basedpyright，就把下面的 pyright 换成 basedpyright
        pyright = {
          handlers = {
            -- 拦截并丢弃进度通知
            ["$/progress"] = function() end,
          },
          settings = {
            python = {
              analysis = {
                -- 顺便限制它只分析打开的文件，降低后台 CPU 消耗
                autoImportCompletions = true,
                includeAliasesFromUserFiles = true,
              },
            },
          },
        },
      },
    },
  },
}
