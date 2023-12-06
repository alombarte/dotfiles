local api = vim.api
local gopt = api.nvim_set_option
local au = api.nvim_create_autocmd

--  By default use spaces insted of tabs at a 4 width
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

vim.o.number = true
vim.o.signcolumn = 'auto:3' -- was set to 'no'
vim.o.backup = false
vim.o.nowritebackup = true
vim.o.noswapfile = true

-- vim.opt.guioptions:remove {'T'}
vim.o.visualbell = true

-- write the file to disk when :bnext ..
vim.o.autowrite = true

-- 2=indent, eol, start (this is now the default)
-- allow backspace over autoindent, line breaks,
-- and the start of insert block
-- vim.o.bs = 'indent,eol,start'
vim.opt.fo:remove {'t'}
vim.o.colorcolumn = 80

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- autocmd! bufwritepost .vimrc source %

vim.o.clipboard = 'unnamed'
vim.o.mouse = 'a'

vim.o.hlsearch = true
vim.o.ruler = true
vim.o.cursorline = true

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.wrap = true

vim.o.filetype = 'off'

vim.o.lazyredraw = true
-- vim.o.wildmeu = true

vim.o.foldenable = true
vim.o.foldlevelstart = 10
vim.o.foldnestmax = 10
vim.o.foldmethod = 'indent'

-- set the leader key
vim.g.mapleader = ','

-- commands:
vim.cmd('syntax on')
vim.cmd('color kanagawa-wave')



local file_type_python = function()
    -- vim.api.nvim_set_option('omnifunc', 'pythoncomplete#Complete')
    vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

au('FileType', { pattern = '*.py', callback = file_type_python})
vim.g.SuperTabDefaultCompletionType = "context"
-- vim.g.completeopt = {'menuone', 'longest', 'preview'}
vim.g.completeopt = {'menu', 'menuone', 'noselect'}

vim.g.grepprg = 'rg --vimgrep --no-heading'
-- set grepprg=rg\ --vimgrep\ --no-heading
vim.g.grepformat = '%f:%l:%c:%m,%f:%l:%m'


au('InsertLeave', { pattern = '*', command = 'match ExtraWhitespace /\\s\\+$/'})
vim.g['t_Co'] = 256
-- highlight ColorColumn ctermbg=24 guibg=#080201
-- highlight ExtraWhitespace ctermbg=49 guibg=#00ff00
-- autocmd ColorScheme * highlight ExtraWhitespace ctermbg=49 guibg=#9988BB
-- autocmd ColorScheme * highlight ColorColumn guibg=#0c0c0c

-- " set cursorline
-- highlight CursorLine cterm=bold


vim.o.wrap = true

-- !?
vim.g.path = {'**'}

--
-- Go setup
--
au('BufWritePre', { pattern = { "*.go" }, 
    callback = function(ev)
        vim.lsp.buf.format()
    end
})

vim.g.vimwiki_list = {{path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}}

au('BufWritePre', { pattern = { '*.py' }, callback = vim.lsp.buf.format })
