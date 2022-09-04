require("which-key").setup({
	triggers = { "<space>" },
})

local wk = require("which-key")
wk.register({
	c = {
		name = "config",
		r = { "<cmd>source %<cr>", "reload" },
		e = { "<cmd>edit ~/.config/nvim/.vimrc<cr>", "edit .vimrc" },
	},
	f = {
		name = "file and finder",
		t = { "<cmd>NvimTreeToggle<cr>", "file tree" },
		f = { "<cmd>Telescope find_files<cr>", "find file" },
		b = { "<cmd>Telescope buffers<cr>", "find buffer" },
		p = { "<cmd>Telescope live_grep<cr>", "find pattern" },
	},
	s = {
		name = "save",
		s = { "<cmd>w<cr>", "save" },
		q = { "<cmd>wq<cr>", "save and quit" },
	},
	g = {
		name = "git",
		s = { "<cmd>Git<cr>", "status" },
		c = { "<cmd>Git commit<cr>", "commit" },
		p = { "<cmd>Git push<cr>", "push" },
		h = { "<cmd>DiffviewFileHistory<cr>", "history" },
		d = { "<cmd>DiffviewOpen<cr>", "open diff" },
		D = { "<cmd>DiffviewClose<cr>", "closs diff" },
	},
	l = {
		name = "language",
		t = {
			name = "tag and symbol",
			o = { "<cmd>LSoutlineToggle<cr>", "outline" },
			f = { "<cmd>Telescope treesitter<cr>", "find symbol" },
		},
		l = {
			name = "LSP",
			h = { "<cmd>Lspsaga hover_doc<CR>", "hover doc" },
			f = { "<cmd>Lspsaga lsp_finder<CR>", "finder" },
			r = { "<cmd>Lspsaga rename<CR>", "rename" },
			a = { "<cmd>Lspsaga code_action<CR>", "code action" },
			s = { "<cmd>Lspsaga signature_help<CR>", "signature help" },
			D = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "workspace diagnostic" },
			d = { "<cmd>TroubleToggle document_diagnostics<CR>", "document diagnostic" },
		},
	},
	t = {
		name = "terminal",
		t = { "<cmd>ToggleTerm direction=float<cr>", "float" },
		h = { "<cmd>ToggleTerm size=20 direction=horizontal<cr>", "horizontal" },
		v = { "<cmd>ToggleTerm size=50 direction=vertical<cr>", "vertical" },
	},
	w = {
		name = "window",
		s = { "<cmd>WinShift<cr>", "shift window" },
	},
	q = { "<cmd>qa!<cr>", "close all and exit" },
	-- u = {
	-- 	name = "testing",
	-- 	tt = { "<cmd>Ultest<cr>", "run all test" },
	-- 	ts = { "<cmd>Ultest<cr>", "stop all test" },
	-- 	nn = { "<cmd>UltestNearest<cr>", "run nearest test" },
	-- 	ns = { "<cmd>UltestNearest<cr>", "stop nearest test" },
	-- 	o = { "<cmd>UltestOutput<cr>", "test output" },
	-- 	s = { "<cmd>UltestSummary<cr>", "test summary" },
	-- 	dd = { "<cmd>UltestDebug<cr>", "debug all test" },
	-- 	dn = { "<cmd>UltestDebugNearest<cr>", "debug nearest test" },
	-- },
}, { prefix = "<space>" })
