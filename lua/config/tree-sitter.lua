require("nvim-treesitter.configs").setup({
	sync_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

require("nvim-treesitter.parsers").get_parser_configs().just = {
	install_info = {
		url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
	maintainers = { "@IndianBoy42" },
}

require("nvim-treesitter.install").compilers = { "zig" }
