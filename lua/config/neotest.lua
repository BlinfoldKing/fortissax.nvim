require("neotest").setup({
	adapters = {
		require("neotest-python"),
		require("neotest-plenary"),
		require("neotest-go"),
		require("neotest-jest"),
		require("neotest-rspec"),
		require("neotest-dart"),
		require("neotest-testthat"),
		require("neotest-phpunit"),
		require("neotest-rust"),
	},
})
