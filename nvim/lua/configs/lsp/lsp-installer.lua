local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local user_plugin_opts = require("core.utils").user_plugin_opts

lsp_installer.on_server_ready(function(server)
  local opts = server:get_default_options()
  opts.on_attach = require("configs.lsp.handlers").on_attach
  opts.capabilities = require("configs.lsp.handlers").capabilities

  -- Apply custom server settings (if available)
  local present, overrides = pcall(require, "configs.lsp.server-settings." .. server.name)
  if present then
    opts = vim.tbl_deep_extend("force", overrides, opts)
  end

  opts = user_plugin_opts("lsp.server-settings." .. server.name, opts)

  server:setup(opts)
end)
