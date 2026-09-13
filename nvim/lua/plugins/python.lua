return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          handlers = {
            ["$/progress"] = function() end,
          },
          settings = {
            python = {
              analysis = {
                diagnosticMode = "openFilesOnly",
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
