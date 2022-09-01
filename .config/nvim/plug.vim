if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter & PlugInstall
  "autocmd VimEnter & PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugin')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
  Plug 'hoob3rt/lualine.nvim'
endif
call plug#end()
