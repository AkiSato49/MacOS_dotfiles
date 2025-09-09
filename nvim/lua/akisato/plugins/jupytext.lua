return {
	"GCBallesteros/jupytext.nvim",
	lazy = false, -- keep this so it always loads for .ipynb
	config = function()
		require("jupytext").setup({
			style = "markdown",
			output_extension = "md",
			force_ft = "markdown",
		})
	end,
}
