local nix_mode, _ = ...

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
	else
		return require(string.format("config.%s", module))
	end
end

return require("packer").startup({
	function()
		-- actual plugins list
		use("wbthomason/packer.nvim")

		-- TODO: reactivate when bug is fixed
		-- use 'ggandor/lightspeed.nvim'
		--
		-- ui and editor
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
		use({
			"APZelos/blamer.nvim",
		})

		-- util
		use({
			"kyazdani42/nvim-tree.lua",
			config = [[load('nvim-tree')]],
		})

		use({
			"folke/which-key.nvim",
			config = [[load('which-key')]],
		})

		use("nvim-lua/plenary.nvim")

		use({
			"nvim-telescope/telescope.nvim",
		})

		use({ "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" })

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
			config = [[load('masonlsp')]],
		})
		use({
			"neovim/nvim-lspconfig",
		})
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
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
			"j-hui/fidget.nvim",
			config = [[load('fidget')]],
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

		use({
			"startup-nvim/startup.nvim",
			requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
			config = function()
				require("startup").setup({ theme = "evil" })
			end,
		})
		use("folke/twilight.nvim")
		use("rktjmp/lush.nvim")

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
			"chentoast/marks.nvim",
			config = function()
				require("marks").setup({})
			end,
		})
		use("mg979/vim-visual-multi")

		-- windows utils
		use("sindrets/winshift.nvim")
		-- use("luukvbaal/stabilize.nvim")

		use({
			"nvim-neotest/neotest",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
				"antoinemadec/FixCursorHold.nvim",
			},
		})

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
