require("lint").linters_by_ft = {
	cpp = { "cpplint" },
	c = { "cpplint" },
	go = { "golangci-lint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
