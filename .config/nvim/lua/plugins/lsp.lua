vim.diagnostic.config({
	virtual_text = {
		source = "always",
		prefix = "",
		spacing = 3,
	},
	float = {
		header = false,
		source = "always",
	},
	underline = false,
})

return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {
				"bash-language-server",
				"eslint_d",
				"html-lsp",
				"rust-analyzer",
				"shfmt",
				"solargraph",
				"stylua",
				"tailwindcss-language-server",
				"rufo",
			},
		},
	},
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/neodev.nvim", opts = {} },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local opts = require("config.lsp")

			local icons = require("ui.icons")
			local signs = {
				Error = icons.diagnostics.error,
				Warn = icons.diagnostics.warning,
				Hint = icons.diagnostics.hint,
				Information = icons.diagnostics.information,
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			lspconfig.rust_analyzer.setup(opts)
			lspconfig.solargraph.setup(opts)
			lspconfig.html.setup(opts)
			lspconfig.tailwindcss.setup(opts)
			lspconfig.bashls.setup(opts)
			lspconfig.jsonls.setup(opts)
			lspconfig.lua_ls.setup({
				on_attach = opts.on_attach,
				capabilities = opts.capabilities,
				handlers = opts.handlers,
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})
		end,
	},
}
