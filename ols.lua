-- .config/nvim/after/plugins

require'lspconfig'.ols.setup {
	init_options = {
		collections = {
			{ name = "base",path = vim.fn.expand('~/odin/base') },
			{ name = "core",path = vim.fn.expand('~/odin/core') },
			{ name = "vendor", path = vim.fn.expand('~/odin/vendor') },
			{ name = "shared", path = vim.fn.expand('~/odin/shared') },
		},
	},
}
