local filetype = {
	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
}
if vim.g.fortissax_formatter_c then
	filtype.c = { require("formatter.filetypes.c").clangdformat }
end
if vim.g.fortissax_formatter_cs then
	filtype.cs = { require("formatter.filetypes.cs").clangdformat }
end
if vim.g.fortissax_formatter_go then
	filtype.go = { require("formatter.filetypes.go").gofmt }
end
if vim.g.fortissax_formatter_sh then
	filtype.sh = { require("formatter.filetypes.sh").shfmt }
end
if vim.g.fortissax_formatter_cpp then
	filtype.cpp = { require("formatter.filetypes.cpp").clangdformat }
end
if vim.g.fortissax_formatter_css then
	filtype.css = { require("formatter.filetypes.css").prettierd }
end
if vim.g.fortissax_formatter_lua then
	filtype.lua = { require("formatter.filetypes.lua").stylua }
end
if vim.g.fortissax_formatter_zig then
	filtype.zig = { require("formatter.filetypes.zig").zigfmt }
end
if vim.g.fortissax_formatter_fish then
	filtype.fish = { require("formatter.filetypes.fish").fishindent }
end
if vim.g.fortissax_formatter_html then
	filtype.html = { require("formatter.filetypes.html").prettierd }
end
if vim.g.fortissax_formatter_json then
	filtype.json = { require("formatter.filetypes.json").prettierd }
end
if vim.g.fortissax_formatter_ruby then
	filtype.ruby = { require("formatter.filetypes.ruby").rubocop }
end
if vim.g.fortissax_formatter_rust then
	filtype.rust = { require("formatter.filetypes.rust").rustfmt }
end
if vim.g.fortissax_formatter_toml then
	filtype.toml = { require("formatter.filetypes.toml").taplo }
end
if vim.g.fortissax_formatter_yaml then
	filtype.yaml = { require("formatter.filetypes.yaml").prettierd }
end
if vim.g.fortissax_formatter_cmake then
	filtype.cmake = { require("formatter.filetypes.cmake").cmakeformat }
end
if vim.g.fortissax_formatter_ocaml then
	filtype.ocaml = { require("formatter.filetypes.ocaml").ocamlformat }
end
if vim.g.fortissax_formatter_elixir then
	filtype.elixir = { require("formatter.filetypes.elixir").mixformat }
end
if vim.g.fortissax_formatter_python then
	filtype.python = { require("formatter.filetypes.python").black }
end
if vim.g.fortissax_formatter_svelte then
	filtype.svelte = { require("formatter.filetypes.svelte").prettier }
end
if vim.g.fortissax_formatter_graphql then
	filtype.graphql = { require("formatter.filetypes.graphql").prettierd }
end
if vim.g.fortissax_formatter_markdown then
	filtype.markdown = { require("formatter.filetypes.markdown").prettierd }
end
if vim.g.fortissax_formatter_typescript then
	filtype.typescript = { require("formatter.filetypes.typescript").prettierd }
end
if vim.g.fortissax_formatter_javascript then
	filtype.javascript = { require("formatter.filetypes.javascript").prettierd }
end
if vim.g.fortissax_formatter_javascriptreact then
	filtype.javascriptreact = { require("formatter.filetypes.javascriptreact").prettierd }
end
if vim.g.fortissax_formatter_typescriptreact then
	filtype.typescriptreact = { require("formatter.filetypes.typescriptreact").prettierd }
end

require("formatter").setup({
	filetype = filetype,
})
