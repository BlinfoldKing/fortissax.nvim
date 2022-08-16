require("formatter").setup({
	filetype = {
		c = {
			require("formatter.filetypes.c").clangdformat,
		},
		cs = {
			require("formatter.filetypes.cs").clangdformat,
		},
		go = {
			require("formatter.filetypes.go").gofmt,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangdformat,
		},
		css = {
			require("formatter.filetypes.css").prettierd,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		zig = {
			require("formatter.filetypes.zig").zigfmt,
		},
		fish = {
			require("formatter.filetypes.fish").fishindent,
		},
		html = {
			require("formatter.filetypes.html").prettierd,
		},
		json = {
			require("formatter.filetypes.json").prettierd,
		},
		ruby = {
			require("formatter.filetypes.ruby").rubocop,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		toml = {
			require("formatter.filetypes.toml").taplo,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettierd,
		},
		cmake = {
			require("formatter.filetypes.cmake").cmakeformat,
		},
		ocaml = {
			require("formatter.filetypes.ocaml").ocamlformat,
		},
		elixir = {
			require("formatter.filetypes.elixir").mixformat,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		svelte = {
			require("formatter.filetypes.svelte").prettier,
		},
		graphql = {
			require("formatter.filetypes.graphql").prettierd,
		},
		markdown = {
			require("formatter.filetypes.markdown").prettierd,
		},
		javascript = {
			require("formatter.filetypes.svelte").prettierd,
		},
		typescript = {
			require("formatter.filetypes.svelte").prettierd,
		},
		javascriptreact = {
			require("formatter.filetypes.svelte").prettierd,
		},
		typescriptreact = {
			require("formatter.filetypes.svelte").prettierd,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
