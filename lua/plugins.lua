local nix_mode,_ = ...

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

function load(module)
    if nix_mode == true then
        return dofile(string.format('/etc/nixos/nvim/lua/config/%s.lua', module))
    else
        return require(string.format('config.%s', module))
    end
end

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
            config = [[load('bufferline')]]
        }
        use {
            "nvim-lualine/lualine.nvim",
            config = [[load('lualine')]]
        }
        use {
            "akinsho/toggleterm.nvim",
            config = [[load('toggleterm')]]
        }

        -- git
        use "tpope/vim-fugitive"
        use {
            'lewis6991/gitsigns.nvim',
            config = [[load('gitsigns')]]
        }

        -- util
        use {
            "kyazdani42/nvim-tree.lua",
            config = [[load('nvim-tree')]]
        }

        use {
            "folke/which-key.nvim",
            config = [[load('which-key')]]
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
            config = [[load('lsp_installer')]]
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = [[load('tree-sitter')]]
        }

        use {
            "j-hui/fidget.nvim",
            config = [[load('fidget')]],
        }

        use {
          "folke/trouble.nvim",
          config = [[load('trouble')]]
        }

        use {
            "simrat39/symbols-outline.nvim",
            config = [[load('symbol-outline')]],
        }

        use "sbdchd/neoformat"
        use {
            "ray-x/lsp_signature.nvim",
            config = [[load('lsp_signature')]],
        }

        use {
            "jose-elias-alvarez/null-ls.nvim",
            config = [[load('null-ls')]],
        }
        use "wellle/targets.vim"
        use "elkowar/yuck.vim"

        -- theme and cosmetic
       use 'tiagovla/tokyodark.nvim'
       use 'folke/tokyonight.nvim'
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
            "glepnir/dashboard-nvim",
            config = [[load('dashboard')]]
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
            "chentoast/marks.nvim",
            config = function()
                require'marks'.setup {}
            end
        }
        use "mg979/vim-visual-multi"

        -- windows utils
        use 'sindrets/winshift.nvim'
        use 'luukvbaal/stabilize.nvim'

        -- test and debug
        -- use {
        --     "rcarriga/vim-ultest",
        --     requires = {"vim-test/vim-test"},
        --     run = ":UpdateRemotePlugins",
        --     config = [[load('ultest')]]
        -- }

        use {
          "nvim-neotest/neotest",
          requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
          }
        }

        -- development
        use 'jbyuki/instant.nvim'
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

