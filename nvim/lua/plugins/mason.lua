return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(package)
        return package ~= "codelldb"
      end, opts.ensure_installed or {})
    end,
  },
}
