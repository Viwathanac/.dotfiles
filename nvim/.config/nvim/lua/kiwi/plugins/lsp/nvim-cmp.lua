local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",

		--Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	}
}

function M.config()
	require("luasnip.loaders.from_vscode").lazy_load()

	local luasnip = require("luasnip")

	local cmp = require("cmp")
	cmp.setup({
		completion = {
			completeopt = "menu, menuone, preview, noselect",
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end
		},
        window = {
			documentation = cmp.config.window.bordered(),
			completion = cmp.config.window.bordered(),
        },
		mapping = cmp.mapping.preset.insert({
			['<C-k>'] = cmp.mapping.select_prev_item(),
			['<C-j>'] = cmp.mapping.select_next_item(),
			['<C-u>'] = cmp.mapping.scroll_docs(-4),
			['<C-d>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		}),
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
end

return M
