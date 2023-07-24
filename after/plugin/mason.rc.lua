local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({})

lspconfig.setup {
  ensure_installed = {},
}

local on_attach = function(client, _)
  client.server_capabilities.documentFormattingProvider = false
end

local on_attach_format = function(client, _)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
end


--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require 'lspconfig'.html.setup {
  on_attach = on_attach,
  filetypes = { "html" },
  capabilities = capabilities,
}

require 'lspconfig'.pylsp.setup {
  on_attach = on_attach_format,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100,
          indentSize = 4,
        },
      }
    }
  }
}

require 'lspconfig'.graphql.setup {
  on_attach = on_attach,
  filetypes = { "graphql" },
}

require 'lspconfig'.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach_format,
  filetypes = { "go" },
}

require 'lspconfig'.angularls.setup {
  on_attach = on_attach_format,
  capabilities = capabilities,
}
