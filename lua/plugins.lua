local nix_mode, window_mode, _ = ...

local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- bootstrap packer if not installed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	execute("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")
packer.init({
	enable = true, -- enable profiling via :PackerCompile profile=true
	threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
})
local use = packer.use

function load(module)
	if nix_mode == true then
		return dofile(string.format("/etc/nixos/nvim/lua/config/%s.lua", module))
	elseif window_mode == true then
		return dofile(string.format("C:\\Users\\ganes\\AppData\\Local\\nvim\\lua\\config/%s.lua", module))
    else
		return require(string.format("config.%s", module))
	end
end

return require("packer").startup({
	function()
		-- actual plugins list
		use({ "wbthomason/packer.nvim" })

		-- ui and editor
		use("ggandor/lightspeed.nvim")
		use({
			"rcarriga/nvim-notify",
			config = [[load('notify')]],
		})
		use("junegunn/vim-easy-align")
		use("easymotion/vim-easymotion")
		use({
			"akinsho/bufferline.nvim",
			tag = "*",
			config = [[load('bufferline')]],
		})
		use({
			"nvim-lualine/lualine.nvim",
			config = [[load('lualine')]],
		})
		use({
			"akinsho/toggleterm.nvim",
			config = [[load('toggleterm')]],
		})
		use({
			"kevinhwang91/nvim-ufo",
			requires = "kevinhwang91/promise-async",
			config = [[load('ufo')]],
		})
		-- git
		use("tpope/vim-fugitive")
		use({
			"lewis6991/gitsigns.nvim",
			config = [[load('gitsigns')]],
		})
		-- Packer
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim", config = [[load('diffview')]] })
		use({
			"akinsho/git-conflict.nvim",
			tag = "*",
			config = function()
				require("git-conflict").setup()
			end,
		})
		-- util
		use({
			"kyazdani42/nvim-tree.lua",
			config = [[load('nvim-tree')]],
		})
		use({
			"sudormrfbin/cheatsheet.nvim",

			requires = {
				{ "nvim-telescope/telescope.nvim" },
				{ "nvim-lua/popup.nvim" },
				{ "nvim-lua/plenary.nvim" },
			},
		})

		use({
			"folke/which-key.nvim",
			config = [[load('which-key')]],
		})

		use("nvim-lua/plenary.nvim")

		use({
			"nvim-telescope/telescope.nvim",
		})
		use({ "nvim-telescope/telescope-symbols.nvim" })

		use("tpope/vim-surround")
		use("tpope/vim-repeat")
		use("jiangmiao/auto-pairs")
		use("ervandew/supertab")
		use("tpope/vim-commentary")

		-- language support
		use({
			"williamboman/mason.nvim",
			config = [[load('mason')]],
		})
		use({
			"mhartington/formatter.nvim",
			config = [[load('formatter')]],
		})
		use({
			"williamboman/mason-lspconfig.nvim",
			requires = {
				"neovim/nvim-lspconfig",
			},
			config = [[load('masonlsp')]],
		})

		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-nvim-lua",
				"L3MON4D3/LuaSnip",
				"onsails/lspkind.nvim",
			},
			config = [[load('nvim_cmp')]],
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = [[load('tree-sitter')]],
		})

		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
			config = [[load('lspsaga')]],
		})
		use({
			"mfussenegger/nvim-lint",
			config = [[load('nvimlint')]],
		})
		use("wellle/targets.vim")
		use("elkowar/yuck.vim")
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = [[load('trouble')]],
		})
		use({
			"mfussenegger/nvim-dap",
			config = [[load('dap')]],
		})
		use({
			"rcarriga/nvim-dap-ui",
			config = [[load('dap_ui')]],
		})
		use({
			"nvim-neotest/neotest",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
				"antoinemadec/FixCursorHold.nvim",

				-- language support
				"nvim-neotest/neotest-python",
				"nvim-neotest/neotest-plenary",
				"nvim-neotest/neotest-go",
				"haydenmeade/neotest-jest",
				"olimorris/neotest-rspec",
				"sidlatau/neotest-dart",
				"shunsambongi/neotest-testthat",
				"olimorris/neotest-phpunit",
				"rouge8/neotest-rust",
			},
			config = [[load('neotest')]],
		})

		-- theme and cosmetic
		use("Mofiqul/dracula.nvim")
		use("tiagovla/tokyodark.nvim")
		use("folke/tokyonight.nvim")
		use("yashguptaz/calvera-dark.nvim")
		use("navarasu/onedark.nvim")
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		})
		use("sainnhe/sonokai")
		use("cpea2506/one_monokai.nvim")
		use("kdheepak/monochrome.nvim")
		use("thedenisnikulin/vim-cyberpunk")

		use("folke/twilight.nvim")

		use({
			"petertriho/nvim-scrollbar",
			config = function()
				require("scrollbar").setup({})
			end,
		})

		use("kyazdani42/nvim-web-devicons")
		use({
			"nacro90/numb.nvim",
			config = function()
				require("numb").setup()
			end,
		})
		use({
			"sitiom/nvim-numbertoggle",
			config = function()
				require("numbertoggle").setup()
			end,
		})
		use({
			"chentoast/marks.nvim",
			config = function()
				require("marks").setup({})
			end,
		})
		use("mg979/vim-visual-multi")
		use({
			"glepnir/dashboard-nvim",
			config = [[load('dashboard')]],
		})

		-- windows utils

		-- development
		use("jbyuki/instant.nvim")
	end,
	config = {
		log = { level = os.getenv("PACKER_LOG_LEVEL") or "warn" },
		display = {
			non_interactive = os.getenv("PACKER_NON_INTERACTIVE") or false,
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
