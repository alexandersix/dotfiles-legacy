local M = {}

function M.config()
  local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  local default_opts = {
    ensure_installed = { "astro", "bash", "c", "cmake", "cpp", "css", "dart", "go", "gomod", "graphql", "html", "http", "javascript", "jsdoc", "json", "php", "ruby", "scss", "solidity", "svelte", "toml", "tsx", "typescript", "vim", "vue", "yaml" },
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
  }

  treesitter.setup(require("core.utils").user_plugin_opts("plugins.treesitter", default_opts))
end

return M
