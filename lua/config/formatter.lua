local filetype = {
	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
}
if vim.g.fortissax_formatter_c then
	filetype.c = { require("formatter.filetypes.c").clangdformat }
end
if vim.g.fortissax_formatter_cs then
	filetype.cs = { require("formatter.filetypes.cs").clangdformat }
end
if vim.g.fortissax_formatter_go then
	filetype.go = { require("formatter.filetypes.go").gofmt }
end
if vim.g.fortissax_formatter_sh then
	filetype.sh = { require("formatter.filetypes.sh").shfmt }
end
if vim.g.fortissax_formatter_cpp then
	filetype.cpp = { require("formatter.filetypes.cpp").clangdformat }
end
if vim.g.fortissax_formatter_css then
	filetype.css = { require("formatter.filetypes.css").prettierd }
end
if vim.g.fortissax_formatter_lua then
	filetype.lua = { require("formatter.filetypes.lua").stylua }
end
if vim.g.fortissax_formatter_zig then
	filetype.zig = { require("formatter.filetypes.zig").zigfmt }
end
if vim.g.fortissax_formatter_fish then
	filetype.fish = { require("formatter.filetypes.fish").fishindent }
end
if vim.g.fortissax_formatter_html then
	filetype.html = { require("formatter.filetypes.html").prettierd }
end
if vim.g.fortissax_formatter_json then
	filetype.json = { require("formatter.filetypes.json").prettierd }
end
if vim.g.fortissax_formatter_ruby then
	filetype.ruby = { require("formatter.filetypes.ruby").rubocop }
end
if vim.g.fortissax_formatter_rust then
	filetype.rust = { require("formatter.filetypes.rust").rustfmt }
end
if vim.g.fortissax_formatter_toml then
	filetype.toml = { require("formatter.filetypes.toml").taplo }
end
if vim.g.fortissax_formatter_yaml then
	filetype.yaml = { require("formatter.filetypes.yaml").prettierd }
end
if vim.g.fortissax_formatter_cmake then
	filetype.cmake = { require("formatter.filetypes.cmake").cmakeformat }
end
if vim.g.fortissax_formatter_ocaml then
	filetype.ocaml = { require("formatter.filetypes.ocaml").ocamlformat }
end
if vim.g.fortissax_formatter_elixir then
	filetype.elixir = { require("formatter.filetypes.elixir").mixformat }
end
if vim.g.fortissax_formatter_python then
	filetype.python = { require("formatter.filetypes.python").black }
end
if vim.g.fortissax_formatter_svelte then
	filetype.svelte = { require("formatter.filetypes.svelte").prettier }
end
if vim.g.fortissax_formatter_graphql then
	filetype.graphql = { require("formatter.filetypes.graphql").prettierd }
end
if vim.g.fortissax_formatter_markdown then
	filetype.markdown = { require("formatter.filetypes.markdown").prettierd }
end
if vim.g.fortissax_formatter_typescript then
	filetype.typescript = { require("formatter.filetypes.typescript").prettierd }
end
if vim.g.fortissax_formatter_javascript then
	filetype.javascript = { require("formatter.filetypes.javascript").prettierd }
end
if vim.g.fortissax_formatter_javascriptreact then
	filetype.javascriptreact = { require("formatter.filetypes.javascriptreact").prettierd }
end
if vim.g.fortissax_formatter_typescriptreact then
	filetype.typescriptreact = { require("formatter.filetypes.typescriptreact").prettierd }
end

require("formatter").setup({
	filetype = filetype,
})
