require("lint").linters_by_ft = {
	cpp = vim.g.fortissax_lint_cpp,
	c = vim.g.fortissax_lint_c,
	go = vim.g.fortissax_lint_go,
	cmake = vim.g.fortissax_lint_cmake,
	javascript = vim.g.fortissax_lint_javascript,
	fennel = vim.g.fortissax_lint_fennel,
	glsl = vim.g.fortissax_lint_glsl,
	kotlin = vim.g.fortissax_lint_kotlin,
	lua = vim.g.fortissax_lint_lua,
	nix = vim.g.fortissax_lint_nix,
	php = vim.g.fortissax_lint_php,
	python = vim.g.fortissax_lint_python,
	ruby = vim.g.fortissax_lint_ruby,
	markdown = vim.g.fortissax_lint_markdown,
	yaml = vim.g.fortissax_lint_yaml,
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
