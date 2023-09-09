_G.plugins = {
	coding = {
		mini_ai = "echasnovski/mini.ai",
		nvim_surround = "kylechui/nvim-surround",
		nvim_autopairs = "windwp/nvim-autopairs",
		mini_comment = "echasnovski/mini.comment",
		nvim_cmp = "hrsh7th/nvim-cmp",
		copilot = "zbirenbaum/copilot.lua",
		sources = {
			copilot = "zbirenbaum/copilot-cmp",
			lsp = "hrsh7th/cmp-nvim-lsp",
			buffer = "hrsh7th/cmp-buffer",
			path = "hrsh7th/cmp-path",
			luasnip = "saadparwaiz1/cmp_luasnip",
			spell = "f3fora/cmp-spell",
		},
		luasnip = "L3MON4D3/LuaSnip",
		friendly_snippets = "rafamadriz/friendly-snippets",
	},
	editor = {
		gitsigns = "lewis6991/gitsigns.nvim",
		flash = "folke/flash.nvim",
		telescope = "nvim-telescope/telescope.nvim",
		trouble = "folke/trouble.nvim",
		illuminate = "RRethy/vim-illuminate",
		mini_bufremove = "echasnovski/mini.bufremove",
		todo_comment = "folke/todo-comments.nvim",
		catppuccin = "catppuccin/nvim",
		nvim_tree = "nvim-tree/nvim-tree.lua",
		tmux_navigator = "aserowy/tmux.nvim",
		which_key = "folke/which-key.nvim",
	},
	lsp = {
		markdown_preview = "iamcco/markdown-preview.nvim",
		go = "ray-x/go.nvim",
		mason = "williamboman/mason.nvim",
		mason_lspconfig = "williamboman/mason-lspconfig.nvim",
		mason_null_ls = "jay-babu/mason-null-ls.nvim",
		null_ls = "jose-elias-alvarez/null-ls.nvim",
		nvim_lspconfig = "neovim/nvim-lspconfig",
		lua_neodev = "folke/neodev.nvim",
		cmp_nvim_lsp = "hrsh7th/cmp-nvim-lsp",
		schema_store = "b0o/SchemaStore.nvim",
	},
	treesitter = {
		nvim_ts = "nvim-treesitter/nvim-treesitter",
		nvim_ts_autotag = "windwp/nvim-ts-autotag",
		nvim_ts_textobjects = "nvim-treesitter/nvim-treesitter-textobjects",
		nvim_ts_playground = "nvim-treesitter/playground",
		nvim_ts_commentstring = "JoosepAlviste/nvim-ts-context-commentstring",
	},
	ui = {
		nvim_navic = "SmiteshP/nvim-navic",
		guihua = "ray-x/guihua.lua",
		lualine = "nvim-lualine/lualine.nvim",
		bufferline = "akinsho/bufferline.nvim",
		nvim_web_devicons = "nvim-tree/nvim-web-devicons",
		dressing = "stevearc/dressing.nvim",
		indent_blankline = "lukas-reineke/indent-blankline.nvim",
		nui = "MunifTanjim/nui.nvim",
	},
	util = {
		plenary = "nvim-lua/plenary.nvim",
	},
}
