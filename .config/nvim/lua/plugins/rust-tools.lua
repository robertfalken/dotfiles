return {
	"simrat39/rust-tools.nvim",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
	},
	config = function()
		local server_opts = require("config.lsp")
		require("rust-tools").setup({
			server = server_opts,
			tools = {
				inlay_hints = {
					parameter_hints_prefix = "-> ",
					other_hints_prefix = "<- ",
				},
			},
		})
	end,
}
