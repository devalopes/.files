-- Set `:LspInfo` border
local win = require('lspconfig.ui.windows')
local _default_opts = win.default_opts
win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = 'rounded'
  return opts
end
--

local lsp = require('lspconfig')
-- Global diagnostic config
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
  float = {
    border = 'rounded'
  }
})


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-s>', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '\\', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Show line diagnostics automatically in hover window
  -- note: `vim.o.updatetime` setting is global and should be set only once
  -- vim.o.updatetime = 100
  -- vim.api.nvim_create_autocmd("CursorHold", {
  --   buffer = bufnr,
  --   callback = function()
  --     local opts = {
  --       focusable = false,
  --       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  --       border = 'rounded',
  --       -- source = 'always',
  --       prefix = '',
  --       scope = 'cursor', -- line
  --     }
  --     vim.lsp.buf.hover(nil, opts)
  --   end
  -- })
  --
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-space>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<C-y>', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>fmt', vim.lsp.buf.formatting, bufopts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lsp["sumneko_lua"].setup {
  on_attach = on_attach,
  capabilities = capabilities
}
require("rust-tools").setup {
  server = {
    on_attach = on_attach,
    capabilities = capabilities
  },
  tools = {
    inlay_hints = {
      parameter_hints_prefix = "",
      other_hints_prefix = "➔ "
    }
  }
}
-- Default lspconfig ra setup
-- lsp.rust_analyzer.setup{
--   on_attach = on_attach,
--   -- Server-specific settings...
--   settings = {
--     ["rust-analyzer"] = {}
--   },
--   capabilities = capabilities
-- }

-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
--
-- Change how signs are displayed
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- nil if current buffer
local function bufwinid(bufnr)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == bufnr then
      return win
    end
  end
end

-- Go to definition split window
local function goto_definition(split_cmd)
  local log = require("vim.lsp.log")

  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if vim.tbl_islist(result) then
      if #result > 1 then
        vim.fn.setqflist(vim.lsp.util.locations_to_items(result, "utf-8"))
        vim.api.nvim_command("copen")
      else
        local uri = result[1].uri or result[1].targetUri
        local current_win = bufwinid(vim.uri_to_bufnr(uri))
        if (current_win == nil and split_cmd) then
          vim.cmd(split_cmd)
        end
        vim.lsp.util.jump_to_location(result[1], "utf-8", { reuse_win = true })
      end
    else
      local uri = result.uri or result.targetUri
      local current_win = bufwinid(vim.uri_to_bufnr(uri))
      if (current_win == nil and split_cmd) then
        vim.cmd(split_cmd)
      end
      vim.lsp.util.jump_to_location(result, "utf-8", { reuse_win = true })
    end
  end

  return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition('vsplit')
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
