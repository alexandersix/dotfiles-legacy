local config = {

	header = {
		" ",
		"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
		"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
		"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
		"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
		"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
		"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
		" ",
	},

	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "stable", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "main", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		-- },
	},

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		opt = {
			completeopt = { "menu", "menuone", "noselect" },
			errorbells = false,
			hidden = true,
			hlsearch = false,
			incsearch = true,
			mouse = "v",
			nu = true,
			relativenumber = true, -- sets vim.opt.relativenumber
			shiftwidth = 4,
			tabstop = 4,
			wildmode = "longest:full,full",
			smartindent = false,
		},
		g = {
			mapleader = " ", -- sets vim.g.mapleader
		},
	},

	-- Default theme configuration
	default_theme = {
		diagnostics_style = { italic = true },
		-- Modify the color table
		colors = {
			fg = "#abb2bf",
		},
		-- Modify the highlight groups
		highlights = function(highlights)
			local C = require("default_theme.colors")

			highlights.Normal = { fg = C.fg, bg = C.bg }
			return highlights
		end,
		plugins = { -- enable or disable extra plugin highlighting
			aerial = true,
			beacon = false,
			bufferline = true,
			dashboard = true,
			highlighturl = true,
			hop = false,
			indent_blankline = true,
			lightspeed = false,
			["neo-tree"] = true,
			notify = true,
			["nvim-tree"] = false,
			["nvim-web-devicons"] = true,
			rainbow = true,
			symbols_outline = false,
			telescope = true,
			vimwiki = false,
			["which-key"] = true,
		},
	},

	-- Disable AstroNvim ui features
	ui = {
		nui_input = true,
		telescope_select = true,
	},

	-- Configure plugins
	plugins = {
		-- Add plugins, the packer syntax without the "use"
		init = {
			["akinsho/bufferline.nvim"] = { disable = true },
			-- ["rebelot/heirline.nvim"] = { disable = true },
			["rcarriga/nvim-notify"] = {
				config = function()
					require("notify").setup({
						background_colour = "#000000",
					})
				end,
			},
			["ellisonleao/glow.nvim"] = {},
			["junegunn/goyo.vim"] = {},
			["ellisonleao/gruvbox.nvim"] = {},
			["ThePrimeagen/harpoon"] = {},
			["folke/trouble.nvim"] = {},
			["tpope/vim-fugitive"] = {},
			["szw/vim-maximizer"] = {},
			["alexandersix/vim-blade"] = {},
			["stephpy/vim-php-cs-fixer"] = {
				"stephpy/vim-php-cs-fixer",
				config = function()
					require("user.configs.php-cs-fixer").config()
				end,
			},
			["prettier/vim-prettier"] = {},
			["mhinz/vim-sayonara"] = {},
			["tpope/vim-surround"] = {},
			["vim-test/vim-test"] = {},
			["christoomey/vim-tmux-navigator"] = {},
			["preservim/vimux"] = {},
			["nelstrom/vim-visual-star-search"] = {},
			["camgraff/telescope-tmux.nvim"] = {},
			["nvim-treesitter/nvim-treesitter-context"] = {},
			["ggandor/leap.nvim"] = {
				config = function()
					require("leap").add_default_mappings()
				end,
			},
			["declancm/cinnamon.nvim"] = {
				config = function()
					require("cinnamon").setup()
				end,
			},
			{
				"catppuccin/nvim",
				as = "catppuccin",
				config = function()
					local catppuccin = require("catppuccin")
					local colors = require("catppuccin.palettes").get_palette("mocha")
					colors.none = "NONE"
					catppuccin.setup({
						transparent_background = true,
						custom_highlights = {
							Comment = { fg = colors.overlay1 },
							LineNr = { fg = colors.overlay1 },
							CursorLine = { bg = colors.none },
							CursorLineNr = { fg = colors.lavender },
							DiagnosticVirtualTextError = { bg = colors.none },
							DiagnosticVirtualTextWarn = { bg = colors.none },
							DiagnosticVirtualTextInfo = { bg = colors.none },
							DiagnosticVirtualTextHint = { bg = colors.none },
						},
					})
				end,
			},
			-- {
			-- 	"rose-pine/neovim",
			-- 	as = "rose-pine",
			-- 	tag = "v1.*",
			-- 	config = function()
			-- 		require("rose-pine").setup({
			-- 			disable_background = true,
			-- 		})
			-- 	end,
			-- },

			-- You can disable default plugins as follows:
			-- ["goolord/alpha-nvim"] = { disable = true },
		},
		-- All other entries override the setup() call for default plugins
		["neo-tree"] = function()
			require("user.configs.neo-tree")
		end,

		["telescope"] = function()
			require("user.configs.telescope")
		end,

		["null-ls"] = function(config)
			-- local null_ls = require("null-ls")
			-- -- Check supported formatters and linters
			-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			-- config.sources = {
			-- 	-- Set a formatter
			-- 	-- null_ls.builtins.formatting.rufo,
			-- 	-- Set a linter
			-- 	-- null_ls.builtins.diagnostics.rubocop,
			-- 	-- null_ls.builtins.diagnostics.editorconfig_checker,
			-- }
			return config -- return final config table
		end,
		treesitter = {
			ensure_installed = {
				"astro",
				"bash",
				"c",
				"cmake",
				"cpp",
				"css",
				"dart",
				"go",
				"gomod",
				"graphql",
				"html",
				"http",
				"javascript",
				"jsdoc",
				"json",
				"php",
				"ruby",
				"scss",
				"solidity",
				"svelte",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vue",
				"yaml",
			},
			sync_install = false,
			ignore_install = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			autopairs = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			rainbow = {
				enable = true,
				disable = { "html" },
				extended_mode = false,
				max_file_lines = nil,
			},
			autotag = {
				enable = true,
			},
			-- require "user.configs.treesitter"
			-- ensure_installed = { "lua" },
		},
		["nvim-lsp-installer"] = {
			ensure_installed = { "sumneko_lua" },
		},
		packer = {
			compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
		},
	},

	-- LuaSnip Options
	luasnip = {
		-- Add paths for including more VS Code style snippets in luasnip
		vscode_snippet_paths = {},
		-- Extend filetypes
		filetype_extend = {
			javascript = { "javascriptreact" },
		},
	},

	-- Modify which-key registration
	["which-key"] = {
		-- Add bindings
		register_mappings = {
			-- first key is the mode, n == normal mode
			n = {
				-- second key is the prefix, <leader> prefixes
				["<leader>"] = {
					-- which-key registration table for normal mode, leader prefix
					-- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
				},
			},
		},
	},

	-- CMP Source Priorities
	-- modify here the priorities of default cmp sources
	-- higher value == higher priority
	-- The value can also be set to a boolean for disabling default sources:
	-- false == disabled
	-- true == 1000
	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},

	-- Extend LSP configuration
	lsp = {
		-- enable servers that you already have installed without lsp-installer
		servers = {
			-- "pyright"
		},
		-- add to the server on_attach function
		-- on_attach = function(client, bufnr)
		-- end,

		-- override the lsp installer server-registration function
		-- server_registration = function(server, opts)
		--   require("lspconfig")[server].setup(opts)
		-- end,

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {
			-- example for addings schemas to yamlls
			-- yamlls = {
			--   settings = {
			--     yaml = {
			--       schemas = {
			--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
			--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
			--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
			--       },
			--     },
			--   },
			-- },
		},
	},

	-- Diagnostics configuration (for vim.diagnostics.config({}))
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	-- This function is run last
	-- good place to configure mappings and vim options
	polish = function()
		-- Set key bindings
		local status_ok, fault = pcall(require, "user.bindings")
		if not status_ok then
			error("Failed to load custom bindings\n\n" .. fault)
		end

		-- Set autocommands
		vim.api.nvim_create_augroup("packer_conf", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			desc = "Sync packer after modifying plugins.lua",
			group = "packer_conf",
			pattern = "plugins.lua",
			command = "source <afile> | PackerSync",
		})

		-- Set custom vim options

		-- Set colorscheme after ensuring the gruvbox setup function has run
		local _, gruvbox = pcall(require, "gruvbox")

		gruvbox.setup({
			overrides = {
				StatusLine = { bg = "#1d2021", fg = "#ebdbb2" },
			},
		})
		-- vim.cmd("colorscheme gruvbox")

		-- vim.g.catppuccin_flavour = "macchiato"
		vim.cmd("colorscheme catppuccin")

		-- vim.cmd("colorscheme rose-pine")

		-- Set up custom filetypes
		-- vim.filetype.add {
		--   extension = {
		--     foo = "fooscript",
		--   },
		--   filename = {
		--     ["Foofile"] = "fooscript",
		--   },
		--   pattern = {
		--     ["~/%.config/foo/.*"] = "fooscript",
		--   },
		-- }
	end,
}

return config
