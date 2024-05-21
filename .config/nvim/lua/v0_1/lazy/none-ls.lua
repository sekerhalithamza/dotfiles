return {
	"nvimtools/none-ls.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},

	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.clang_format,
				require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.diagnostics.clang_format,
				require("none-ls.code_actions.eslint_d"),
				null_ls.builtins.code_actions.clang_format,
			},
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
