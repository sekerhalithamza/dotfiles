return {
	"folke/trouble.nvim",

	config = function()
		vim.keymap.set("n", "<leader>tr", vim.cmd.TroubleToggle)
	end,
}
