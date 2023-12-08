local gmap = vim.api.nvim_set_keymap

-- set the leader key
vim.g.mapleader = '.'

-- Buffer management
gmap('', '<C-w>',':bd<CR>', {})


-- The holy Trinity. Open files with .., find code with .r, open buffers with .b

gmap('n', '<leader>b', ':Buffers<CR>', { noremap = true})
gmap('n', '<leader>.', ':Files<CR>', { noremap = true})
gmap('n', '<leader>r', ':Rg<CR>', { noremap = true })
gmap('n', '<leader>t', ':TerminalVSplit zsh<CR>', { noremap = true })
-- Nerdtree
gmap('', '<C-B>', ":NERDTreeToggle<CR>", {})

-- Backspace clears highlighting
gmap('', '<BS>', ':nohl<CR>', { noremap = true })

gmap('', '<leader>l', '<c-w>l', {})
gmap('', '<leader>h', '<c-w>h', {})
gmap('', '<leader>j', '<c-w>j', {})
gmap('', '<leader>k', '<c-w>k', {})

-- Move current lines up and down
gmap('n', '<C-Down>',':m+<CR>==', {})
gmap('n', '<C-Up>',':m-2<CR>==', {})
gmap('i', '<C-Down>','<C-O>:m+<CR><C-O>==', {})
gmap('i', '<C-Up>','<C-O>:m-2<CR><C-O>==', {})
gmap('v', '<C-Down>',  ":m'>+<CR>gv=gv", {})
gmap('v', '<C-Up>', ":m'<-2<CR>gv=gv", {})

gmap('n', '<leader>1',  ':color kanagawa-wave<CR>', {})
gmap('n', '<leader>2',  ':color iceberg<CR>', {})
gmap('n', '<leader>3',  ':color tokyonight-night<CR>', {})
gmap('n', '<leader>4',  ':color habamax<CR>', {})
gmap('n', '<leader>5',  ':color lunaperche<CR>', {})
gmap('n', '<leader>6',  ':color slate<CR>', {})
gmap('n', '<leader>7',  ':color aura-dark<CR>', {})


gmap('n', '<leader>q', ':%s/\\s\\+$//g<CR>', {})
gmap('n', '<leader>s', ':mksession!<CR>', {})
gmap('n', '<leader>S', ':wall<CR>:mksession!<CR>:qall<CR>', {})

gmap('v', '<', '<gv', { noremap = true })
gmap('v', '>', '>gv', { noremap = true })


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

--
-- Telescope
--
gmap('n', '<leader>tff', '<cmd>Telescope find_files<cr>', { noremap = true })
gmap('n', '<leader>tfr', '<cmd>Telescope live_grep<cr>', { noremap = true })
gmap('n', '<leader>tfb', '<cmd>Telescope buffers<cr>', { noremap = true })
gmap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })

-- don't know how, <CR> closes the buffer
gmap('n', '<CR>', 'j', { noremap = true })


vim.g.vimwiki_list = {{path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}}

vim.keymap.set('n', '<leader>gg', vim.cmd.Git)

