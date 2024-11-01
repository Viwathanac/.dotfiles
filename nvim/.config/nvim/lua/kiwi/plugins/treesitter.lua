local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "nvim-treesitter/playground" },
        {
            "simrat39/symbols-outline.nvim",
            config = function()
                require("symbols-outline").setup {}
            end,
        },
    },
}

function M.init()
    vim.keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<cr>", { desc = "Symbols Outline" })
end

function M.config()
	local treesitter = require("nvim-treesitter.configs")
	treesitter.setup({
		auto_install = true,
		highlight = {
			enable = true,
            additional_vim_regex_highlighting = false,
			disable = { "bash" },
		},
		indent = { enable = true },
        context_commentstring = {
            enable = true,
        },
		textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["iB"] = "@block.inner",
                    ["aB"] = "@block.outer",
                    ["iF"] = "@frame.inner",
                    ["aF"] = "@frame.outer",
                },
            },
            swap = {
                enable = true,
                disable = { "lua" },
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]]"] = "@function.outer",
                },
                goto_next_end = {
                    ["]["] = "@function.outer",
                },
                goto_previous_start = {
                    ["[["] = "@function.outer",
                },
                goto_previous_end = {
                    ["[]"] = "@function.outer",
                },
            },
        }
	})
end

return M
