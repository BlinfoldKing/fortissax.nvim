local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    execute "packadd packer.nvim"
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

-- actual plugins list
use "wbthomason/packer.nvim"

-- TODO: reactivate when bug is fixed
-- use 'ggandor/lightspeed.nvim'
use "easymotion/vim-easymotion"
use "kyazdani42/nvim-web-devicons"
use "romgrk/barbar.nvim"
use {
    "nvim-lualine/lualine.nvim",
    config = require("config/lualine")
}
use "akinsho/toggleterm.nvim"


-- git
use "tpope/vim-fugitive"
use "airblade/vim-gitgutter"

-- util
use {
    "kyazdani42/nvim-tree.lua",
    config = require("config/nvim-tree")
}

use {
    "folke/which-key.nvim",
    config = require("config/which-key")
}

use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use {'nvim-telescope/telescope-symbols.nvim', after = 'telescope.nvim'}

use "tpope/vim-surround"
use "tpope/vim-repeat"
use "jiangmiao/auto-pairs"
use "yggdroot/indentline"
use "ervandew/supertab"
use "tpope/vim-commentary"

-- theme and cosmetic
use "sainnhe/sonokai"
use "thedenisnikulin/vim-cyberpunk"
use {
    'sunjon/shade.nvim',
    config = require("config/shade")
}
use {
    "glepnir/dashboard-nvim",
    config = require("config/dashboard")
}
use "folke/twilight.nvim"


-- language support
use {'ms-jpq/coq_nvim', branch = 'coq'}
use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    config = require("config/lsp_installer")
}
use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = "config/tree-sitter"
}

use {
    "j-hui/fidget.nvim",
    config = require("config/fidget")
}

use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
    }
  end
}

use {
    "simrat39/symbols-outline.nvim",
    config = require("config/symbol-outline")
}

use "sbdchd/neoformat"

