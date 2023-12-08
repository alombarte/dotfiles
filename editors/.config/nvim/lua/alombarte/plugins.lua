vim.fn['plug#begin']('~/.local/share/nvim/site/autoload')

local Plug = vim.fn['plug#']

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

-- Install fzf to search for files
-- commands here: https://github.com/junegunn/fzf.vim#commands
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install'] })
Plug('junegunn/fzf.vim')

-- LSP Config
--
Plug 'neovim/nvim-lspconfig'

-- Autocomplete
Plug "hrsh7th/nvim-cmp"
Plug "hrsh7th/cmp-nvim-lsp"
-- Plug 'https://github.com/neoclide/coc.nvim'

-- Fashion Victim
-- Terminal should have a font from https://github.com/ryanoasis/nerd-fonts
Plug 'https://github.com/ryanoasis/vim-devicons'

-- Status bar please
Plug 'https://github.com/vim-airline/vim-airline'

-- File explorer
Plug 'preservim/nerdtree'

-- Terminal
-- Plug 'https://github.com/tc50cal/vim-terminal'

-- Multi selection
Plug 'mg979/vim-visual-multi'

-- Class outline viewer
-- requires ctags
-- Plug 'https://github.com/preservim/tagbar'

-- NeoGit ?
--
Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'


Plug 'tomlion/vim-solidity'

-- Telescope
--
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

-- TreeSitter (decent highlighting)
-- :TSInstall go
-- :TSInstall json
-- :TSInstall mermaid
-- :TSInstall markdown
-- :TSInstall lua
-- :TSInstall toml
-- :TSInstall vim
Plug 'nvim-treesitter/nvim-treesitter'

-- Comments with gcc & gc
Plug 'https://github.com/tpope/vim-commentary'

-- Themes
Plug 'rebelot/kanagawa.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'catppuccin/nvim'
Plug 'folke/tokyonight.nvim'
Plug 'cocopon/iceberg.vim'
Plug 'daltonmenezes/aura-theme'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'

vim.fn['plug#end']()

