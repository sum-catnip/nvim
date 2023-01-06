local cfg = require('lspconfig')
local vf = require('vfuncs')
local bind = require('binds')

local servers = {
  pyright = {},
  rust_analyzer = {},
  hls = { root_dir = vim.loop.cwd },
  sumneko_lua = {
    cmd = {'lua-language-server'},
    diagnostics = {
      enable = true,
      globals = { "hs", "vim", "it", "describe", "before_each", "after_each" },
      disable = { "lowercase-global" }
    },
    workspace = {
      library = {
        [vf.expand('$VIMRUNTIME/lua')] = true,
        [vf.expand('$VIMRUNTIME/lua/vim/lsp')] = true
      }
    }
  },
  clangd = {}
}

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opt = {'noremap', 'silent', 'cmd', bufid=bufnr}

  bind('n', 'dD', vim.lsp.buf.declaration, opt)
  bind('n', 'gd', vim.lsp.buf.definition, opt)
  bind('n', 'K', vim.lsp.buf.hover, opt)
  bind('n', 'gi', vim.lsp.buf.implementation, opt)
  bind('n', 'C-k', vim.lsp.buf.signature_help, opt)
  bind('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opt)
  bind('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opt)
  bind('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opt)
  bind('n', '<space>D', vim.lsp.buf.type_definition, opt)
  bind('n', '<space>rn', vim.lsp.buf.rename, opt)
  bind('n', '<space>ca', vim.lsp.buf.code_action, opt)
  bind('n', 'gr', vim.lsp.buf.references, opt)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.document_formatting then
    bind('n', '<space>f', vim.lsp.buf.formatting, opt)
  elseif client.server_capabilities.document_range_formatting then
    bind('n', '<space>f', vim.lsp.buf.range_formatting, opt)
  end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    -- i should really start supporting autogroups
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
for k, v in pairs(servers) do
  v.on_attach = on_attach
  cfg[k].setup(v)
end
