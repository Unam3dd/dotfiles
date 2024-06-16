require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "rust-analyzer" },
	automatic_installation = true,
})

