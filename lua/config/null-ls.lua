require("null-ls").setup({
	sources = {
		require("null-ls").builtins.code_actions.eslint,

		require("null-ls").builtins.diagnostics.eslint,

		require("null-ls").builtins.completion.spell,

		require("null-ls").builtins.formatting.stylua,
	},
	on_init = function(new_client, _)
		new_client.offset_encoding = "utf-8"
	end,
})
