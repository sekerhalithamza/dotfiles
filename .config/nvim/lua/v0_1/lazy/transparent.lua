return {
	"xiyaowong/transparent.nvim",

	config = function()
		require("transparent").setup({
			extra_groups = {
				"NormalFloat",
			},
		})

		vim.keymap.set("n", "<leader>T", "<CMD>TransparentToggle<CR>")
	end,
}
