local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local first = false
-- bootstrap packer if not installed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    first = true
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

        function get_config(name)
            return string.format("[[require(\"config.%s\")", name)
        end

        -- TODO: reactivate when bug is fixed
        -- use 'ggandor/lightspeed.nvim'
        use "easymotion/vim-easymotion"
        use "kyazdani42/nvim-web-devicons"
        use "romgrk/barbar.nvim"
        use {
            "nvim-lualine/lualine.nvim",
            config = [[require('config.lualine')]]
        }
        use "akinsho/toggleterm.nvim"

        -- git
        use "tpope/vim-fugitive"
        use "airblade/vim-gitgutter"
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
        use "yggdroot/indentline"
        use "ervandew/supertab"
        use "tpope/vim-commentary"

        -- theme and cosmetic
        use '~/.config/nvim/dragonlich'
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

        -- language support
        use {'ms-jpq/coq_nvim', branch = 'coq'}
        use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
        use 'neovim/nvim-lspconfig'
        use {
            'williamboman/nvim-lsp-installer',
            config = require('config/lsp_installer')
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
          requires = "kyazdani42/nvim-web-devicons",
          config = function()
            require("trouble").setup {
            }
          end
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
        -- first time init
        if first then
            vim.api.nvim_command("PackerSync")
            vim.api.nvim_command("PackerCompile")
            vim.api.nvim_command("COQdeps")
        end

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





