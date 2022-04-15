local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- bootstrap packer if not installed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
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

return require("packer").startup {
	function()

        -- actual plugins list
        use "wbthomason/packer.nvim"

        -- TODO: reactivate when bug is fixed
        -- use 'ggandor/lightspeed.nvim'
        use "easymotion/vim-easymotion"
        use {
            'akinsho/bufferline.nvim',
            tag = "*",
            config = [[require('config.bufferline')]]
        }
        use {
            "nvim-lualine/lualine.nvim",
            config = [[require('config.lualine')]]
        }
        use {
            "akinsho/toggleterm.nvim",
            config = [[require('config.toggleterm')]]
        }

        -- git
        use "tpope/vim-fugitive"
        use {
            'lewis6991/gitsigns.nvim',
            config = [[require("config.gitsigns")]]
        }

        -- util
        use {
            "kyazdani42/nvim-tree.lua",
            config = [[require("config.nvim-tree")]]
        }

        use {
            "folke/which-key.nvim",
            config = [[require("config.which-key")]]
        }

        use 'nvim-lua/plenary.nvim'

        use {
          'nvim-telescope/telescope.nvim',
        }

        use {'nvim-telescope/telescope-symbols.nvim', after = 'telescope.nvim'}

        use "tpope/vim-surround"
        use "tpope/vim-repeat"
        use "jiangmiao/auto-pairs"
        use "ervandew/supertab"
        use "tpope/vim-commentary"

        -- language support
        use {'ms-jpq/coq_nvim', branch = 'coq'}
        use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
        use 'neovim/nvim-lspconfig'
        use {
            'williamboman/nvim-lsp-installer',
            config = [[require('config/lsp_installer')]]
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = [[require("config.tree-sitter")]]
        }

        use {
            "j-hui/fidget.nvim",
            config = [[require("config.fidget")]],
        }

        use {
          "folke/trouble.nvim",
          config = [[require("config.trouble")]]
        }

        use {
            "simrat39/symbols-outline.nvim",
            config = [[require("config.symbol-outline")]],
        }

        use "sbdchd/neoformat"
        use {
            "ray-x/lsp_signature.nvim",
            config = [[require("config.lsp_signature")]],
        }

        use {
            "jose-elias-alvarez/null-ls.nvim",
            config = [[require("config.null-ls")]],
        }
        use "wellle/targets.vim"

        -- theme and cosmetic
       use 'tiagovla/tokyodark.nvim'
       use 'yashguptaz/calvera-dark.nvim'
       use {
            'norcalli/nvim-colorizer.lua',
            config = function()
                require('colorizer').setup()
            end
        }
        use "sainnhe/sonokai"
        use "thedenisnikulin/vim-cyberpunk"
        use {
            'sunjon/shade.nvim',
            config = [[require("config.shade")]]
        }
        use {
            "glepnir/dashboard-nvim",
            config = [[require("config.dashboard")]]
        }
        use "folke/twilight.nvim"
        use "rktjmp/lush.nvim"

        use {
            'petertriho/nvim-scrollbar',
            config = function()
                require('scrollbar').setup {}
            end
        }

        use "kyazdani42/nvim-web-devicons"
        -- use "yamatsum/nvim-nonicons"
        use "romgrk/nvim-treesitter-context"
        use {
            "nacro90/numb.nvim",
            config = function()
                require('numb').setup()
            end
        }
        use {
            "chentau/marks.nvim",
            config = function()
                require'marks'.setup {}
            end
        }

        -- windows utils
        use 'sindrets/winshift.nvim'
        use 'luukvbaal/stabilize.nvim'

        -- test and debug
        use { 
            "rcarriga/vim-ultest",
            requires = {"vim-test/vim-test"},
            run = ":UpdateRemotePlugins",
            config = [[require("config.ultest")]]
        }
    end,
    config = {
		log = { level = os.getenv "PACKER_LOG_LEVEL" or "warn" },
		display = {
			non_interactive = os.getenv "PACKER_NON_INTERACTIVE" or false,
			open_fn = function()
				return require("packer.util").float { border = "single" }
			end,
		},
	},
}





