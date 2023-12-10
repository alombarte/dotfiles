local gmap = vim.api.nvim_set_keymap

-- set the leader key
vim.g.mapleader = '.'

-- The holy Trinity. Open files with .., find code with .r, open buffers with .b

gmap('n', '<leader>b', ':Buffers<CR>', { noremap = true})
gmap('n', '<leader>.', ':Files<CR>', { noremap = true})
gmap('n', '<leader>r', ':Rg<CR>', { noremap = true })

-- Panes and tabs
gmap('n', '<leader>v', ':vsplit<CR>', { noremap = true })
gmap('n', '<leader><Right>', ':tabnext<CR>', { noremap = true })
gmap('n', '<leader><Left>', ':tabprevious<CR>', { noremap = true })
gmap('n', '<leader>t', ':TagbarToggle<CR>', { noremap = true })


-- Nerdtree
gmap('', '<C-B>', ":NERDTreeRefreshRoot<CR>:NERDTreeToggle<CR>", {})

-- Backspace clears highlighting
gmap('n', '<BS>', ':nohl<CR>', { noremap = true })

gmap('', '<leader>l', '<C-w>l', { noremap = true})
gmap('', '<leader>h', '<C-w>h', { noremap = true})
gmap('', '<leader>j', '<C-w>j', { noremap = true})
gmap('', '<leader>k', '<C-w>k', { noremap = true})
gmap('', '<C-w>', ':bd<CR>', {})

-- Move current lines up and down
-- gmap('i', '<leader><Down>','<C-O>:m+<CR><C-O>==', {})
-- gmap('i', '<leader><Up>','<C-O>:m-2<CR><C-O>==', {})
-- gmap('v', '<leader><Up>', ":m'<-2<CR>gv=gv", {})
-- gmap('v', '<leader><Down>',  ":m'>+<CR>gv=gv", {})
gmap('n', '<leader><Down>',':m+<CR>==', {})
gmap('n', '<leader><Up>',':m-2<CR>==', {})

gmap('n', '<leader>c1',  ':color kanagawa-wave<CR>', {})
gmap('n', '<leader>c2',  ':color iceberg<CR>', {})
gmap('n', '<leader>c3',  ':color tokyonight-night<CR>', {})
gmap('n', '<leader>c4',  ':color habamax<CR>', {})
gmap('n', '<leader>c5',  ':color lunaperche<CR>', {})
gmap('n', '<leader>c6',  ':color slate<CR>', {})
gmap('n', '<leader>c7',  ':color aura-dark<CR>', {})

gmap('n', '<leader>q', ':%s/\\s\\+$//g<CR>', {})
gmap('n', '<leader>s', ':mksession!<CR>', {})
gmap('n', '<leader>S', ':wall<CR>:mksession!<CR>:qall<CR>', {})

gmap('v', '>', '<gv', { noremap = true })
gmap('v', '<', '>gv', { noremap = true })


gmap('n','<space>', 'za', { noremap = true })
gmap('n', 'j', 'gj', { noremap = true })
gmap('n', 'k', 'gk', { noremap = true })

-- Quick fix window navigation and open and close
gmap('n', '<C-n>', ':cn<CR>', { noremap = true })
gmap('n', '<C-m>', ':cp<CR>', { noremap = true })
gmap('n', '<C-N>', ':copen<CR>', { noremap = true })
gmap('n', '<C-M>', ':close<CR>', { noremap = true })


gmap('n', '<C-j>', '<C-f>', { noremap = true })
gmap('n', '<C-k>', '<C-b>', { noremap = true })

--
-- NERDTree
--
gmap('n', '<leader>nt', ':NERDTreeToggle<CR>', { noremap = true })
gmap('n', '<leader>ntf', ':NERDTreeFocus<CR>', { noremap = true })
gmap('n', '<leader>ntt', ':NERDTree<CR>', { noremap = true })

-- don't know how, <CR> closes the buffer
gmap('n', '<CR>', 'j', { noremap = true })


vim.g.vimwiki_list = {{path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}}

vim.keymap.set('n', '<leader>gg', vim.cmd.Git)

