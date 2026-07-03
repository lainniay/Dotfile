local vim = rawget(_G, "vim")

local function is_hls_import_lens_noise(message)
  if type(message) ~= "string" then
    return false
  end

  return message:find("importLens", 1, true) ~= nil
    or message:find("explicit-fields", 1, true) ~= nil
    or message:find("SMethod_TextDocumentInlayHint", 1, true) ~= nil
end

local function suppress_hls_import_lens_noise(default_handler)
  return function(err, result, ctx, config)
    if is_hls_import_lens_noise(err and err.message) or is_hls_import_lens_noise(result and result.message) then
      return
    end

    if default_handler ~= nil then
      return default_handler(err, result, ctx, config)
    end
  end
end

local function disable_hls_import_lens_features(client_id)
  local client = vim.lsp.get_client_by_id(client_id)

  if client == nil then
    return
  end

  client.server_capabilities.codeActionProvider = nil
  client.server_capabilities.codeLensProvider = nil
  client.server_capabilities.inlayHintProvider = nil
end

local function stop_duplicate_lspconfig_hls(client_id)
  local client = vim.lsp.get_client_by_id(client_id)

  if client ~= nil and client.name == "hls" then
    client:stop(true)
  end
end

return {
  {
    "mrcjkb/haskell-tools.nvim",
    lazy = false,
    init = function()
      local default_handlers = vim.lsp.handlers
      local show_message_handler = suppress_hls_import_lens_noise(default_handlers["window/showMessage"])
      local show_message_request_handler = suppress_hls_import_lens_noise(default_handlers["window/showMessageRequest"])

      vim.lsp.handlers["window/showMessage"] = show_message_handler
      vim.lsp.handlers["window/showMessageRequest"] = show_message_request_handler

      vim.lsp.config("hls", {
        autostart = false,
        filetypes = {},
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("disable_duplicate_haskell_lsp", { clear = true }),
        callback = function(event)
          stop_duplicate_lspconfig_hls(event.data.client_id)
        end,
      })

      vim.lsp.config("haskell-tools.nvim", {
        handlers = {
          ["textDocument/codeAction"] = suppress_hls_import_lens_noise(default_handlers["textDocument/codeAction"]),
          ["textDocument/codeLens"] = suppress_hls_import_lens_noise(default_handlers["textDocument/codeLens"]),
          ["textDocument/inlayHint"] = suppress_hls_import_lens_noise(default_handlers["textDocument/inlayHint"]),
          ["window/showMessage"] = show_message_handler,
          ["window/showMessageRequest"] = show_message_request_handler,
        },
      })

      vim.g.haskell_tools = {
        tools = {
          codeLens = {
            autoRefresh = false,
          },
        },
        hls = {
          on_attach = function(client_id)
            disable_hls_import_lens_features(client_id)
          end,
          settings = {
            haskell = {
              plugin = {
                importLens = {
                  globalOn = false,
                  codeActionsOn = false,
                  codeLensOn = false,
                  inlayHintsOn = false,
                },
                ["explicit-fields"] = {
                  globalOn = false,
                  codeActionsOn = false,
                  inlayHintsOn = false,
                },
              },
            },
          },
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.hls = {
        enabled = false,
        autostart = false,
      }

      opts.setup = opts.setup or {}
      opts.setup.hls = function()
        return true
      end
    end,
  },
}
