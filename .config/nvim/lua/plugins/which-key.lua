return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.register({
			f = {
				name = "Telescope",
				g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
				b = { "<cmd>Telescope buffers<cr>", "Buffers" },
				h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
				c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
			},
			v = {
				name = "Vimux",
				p = { "<cmd>VimuxPromptCommand<cr>", "Prompt command" },
				l = { "<cmd>VimuxRunLastCommand<cr>", "Run last command" },
			},
			c = {
				name = "Code",
				d = {
					function()
						vim.diagnostic.open_float()
					end,
					"Line diagnostics",
				},
				D = { "<cmd>Telescope diagnostics<cr>", "All diagnostics" },
			},
			["|"] = { "<cmd>vspl<cr>", "Vertical split" },
			["_"] = { "<cmd>spl<cr>", "Horizontal split" },
		}, {
			prefix = "<leader>",
			mode = "n",
			silent = true,
			noremap = true,
			nowait = true,
		})
	end,
}
