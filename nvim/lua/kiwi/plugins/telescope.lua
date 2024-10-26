local M = { 'nvim-telescope/telescope.nvim', tag = '0.1.8',
	cmd = "Telescope",
	lazy = false,
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-fzf-native.nvim' },
	},
}

function M.init()
	vim.keymap.set({"n", "v"}, "<leader>tc", "<cmd>Telescope commands<cr>", {}) 
	vim.keymap.set("n", "<leader>fp", "<cmd>Telescope find_files<cr>", {}) 
	vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", {}) 
	vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", {}) 
end

function M.config()
	local custom_theme = {
		pickers = {
			find_files = {
				find_command = { "rg", "--type=file", "--hidden", "--smart-case" },
			},
			live_grep = {
				only_sort_text = true,
			},
		},
		layout_config = {
			prompt_position = "bottom",
			horizontal = {
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		scroll_strategy = "cycle",
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = ">",
		path_display = { "truncate" },
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" },
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			n = {
				["<c-d>"] = require("telescope.actions").delete_buffer,
			},
		},
	}
    require("telescope").setup {
        defaults = custom_theme,
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    }
end
 
return M
