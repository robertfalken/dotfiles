return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	keys = {
		-- { "<leader>\\", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "right",
			},
			filesystem = {
				filtered_items = {
					always_show = { ".envrc", ".gitignore" },
				},
				hide_by_name = {
					".DS_Store",
					"Cargo.lock",
					"package-lock.json",
				},
				never_show = {
					".DS_Store",
				},
			},
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added = "",
						modified = "",
						deleted = "", -- this can only be used in the git_status source
						renamed = "", -- this can only be used in the git_status source
						-- Status type
						untracked = "★",
						ignored = "◌",
						unstaged = "✗",
						staged = "",
						conflict = "",
					},
				},
			},
		})
	end,
}
