local nvim_lsp = require('lspconfig')
local util = require('lspconfig/util')

-- Autocompletion: is a little bit annoying, would
-- be better to have a way to invoke it when needed 
--
-- local default_conf = util.default_config
-- local cmp_nvim_lsp = require('cmp_nvim_lsp')
-- default_conf.capabilities = vim.tbl_deep_extend(
--     'force',
--     default_conf.capabilities,
--     cmp_nvim_lsp.default_capabilities()
-- )
-- local cmp = require('cmp')
-- cmp.setup({
--     mapping = cmp.mapping.preset.insert({
--         ['<C-o>'] = cmp.mapping.complete()
--     }),
--     sources = cmp.config.sources({
--         { name = 'nvim_lsp'},
--     })
-- })

local map = vim.api.nvim_set_keymap

local lsp_mappings = function(client)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

  -- go to implementation might open the quick list if there are several
  -- implementation for a function, so we might need to navigate it
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format , bufopts)

  vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, bufopts)

  vim.keymap.set('n', '<leader>dbg', ':Termdebug', bufopts) 

  -- This does not work well:
  -- vim.keymap.set('i', '<C-N>', vim.lsp.omnifunc, bufopts)

end

local rust_on_attach = function(client)
    lsp_mappings(client)
end

nvim_lsp.rust_analyzer.setup({
    on_attach = rust_on_attach,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
        signs = false,
        update_in_insert = false,
        underline = false,
        severity_sort = false,
	}
)

-- function GoOrgImports(wait_ms)
--     local params = vim.lsp.util.make_range_params()
--     params.context = {only = {"source.organizeImports"}}
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
--     for _, res in pairs(result or {}) do
--       for _, r in pairs(res.result or {}) do
--         if r.edit then
--           vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
--         else
--           vim.lsp.buf.execute_command(r.command)
--         end
--       end
--     end
-- end

local go_on_attach = function(client)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  --
  vim.keymap.set('n', '<leader>tj', ':GoTagAdd json', bufopts) 
  vim.keymap.set('n', '<leader>ty', ':GoTagAdd yaml', bufopts) 
  lsp_mappings(client)
end

nvim_lsp.gopls.setup({
    on_attach = go_on_attach,
    -- capabilities ? 
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                unreachable = true,
            },
            staticcheck = true,
            completeUnimported = true,
        },
    },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
})


local python_on_attach = function(client)
    lsp_mappings(client)
end

nvim_lsp.pyright.setup({
    on_attach = python_on_attach,
    filetypes = {"python"},
})


