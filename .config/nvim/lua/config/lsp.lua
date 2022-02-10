local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(_, buf)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code actions" })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "Go to definition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buf, desc = "Go to declaration" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = buf, desc = "Go to implementation" })
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = buf, desc = "Go to type definition" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover" })
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = buf, desc = "Rename" })
end

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#2A2B3F]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=Black guibg=#2A2B3F]]

local border = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}


local _M = {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
}

return _M
