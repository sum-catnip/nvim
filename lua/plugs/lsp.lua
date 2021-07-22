local fzf_lsp = require('fzf_lsp')
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
  }
}

local function on_attach(client, bufnr)
  require('completion').on_attach()
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opt = {'noremap', 'silent', 'cmd', bufid=bufnr}

  bind('n', 'dD', fzf_lsp.declaration_call, opt)
  bind('n', 'gd', fzf_lsp.definition_call, opt)
  bind('n', 'K', vim.lsp.buf.hover, opt)
  bind('n', 'C-k', vim.lsp.buf.signature_help, opt)
  bind('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opt)
  bind('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opt)
  bind('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opt)
  bind('n', '<space>D', fzf_lsp.type_definition_call, opt)
  bind('n', '<space>rn', vim.lsp.buf.rename, opt)
  bind('n', 'gr', fzf_lsp.references_call, opt)
  bind('n', '<space>e', vim.lsp.diagnostic.show_line_diagnostics, opt)
  bind('n', '<space>le', fzf_lsp.diagnostic_call, opt)
  bind('n', '[d', vim.lsp.diagnostic.goto_prev, opt)
  bind('n', ']d', vim.lsp.diagnostic.goto_next, opt)
  bind('n', '<space>ac', fzf_lsp.code_action_call, opt)
  bind('n', '<space>x', fzf_lsp.incoming_calls_call, opt)
  bind('n', '<space>X', fzf_lsp.outgoing_calls_call, opt)
  bind('n', '<space>fs', fzf_lsp.document_symbol_call, opt)
  bind('n', '<space>fS', function() fzf_lsp.workspace_symbol_call{} end, opt)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    bind('n', '<space>f', vim.lsp.buf.formatting, opt)
  elseif client.resolved_capabilities.document_range_formatting then
    bind('n', '<space>f', vim.lsp.buf.range_formatting, opt)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
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
