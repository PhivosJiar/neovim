local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')


local on_attach = function(client, _)
  -- client.resolved_capabilities.document_formatting = false
  client.server_capabilities.documentFormattingProvider = false
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", 'javascript.jsx' },
  cmd = { "typescript-language-server", "--stdio" },
}

nvim_lsp.sourcekit.setup {
  on_attach = on_attach,
}

nvim_lsp.lua_ls.setup {
  on_attach = function(client, _)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
      vim.api.nvim_command [[augroup END]]
    end
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

local project_library_path = "./node_modules"

local cmd = { "ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations", project_library_path }

-- nvim_lsp.angularls.setup {
--   cmd = cmd,
--   on_new_config = function(new_config)
--     new_config.cmd = cmd
--   end,
-- }

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})
