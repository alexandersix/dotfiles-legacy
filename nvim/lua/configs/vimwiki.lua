local M = {}

function M.config()
  local status_ok, _ = pcall(require, "vimwiki")
  if not status_ok then
    return
  end

  vim.g.vimwiki_list = {
    {
      path = "~/vimwiki",
      syntax = "markdown",
      ext = ".md",
    }
  }
end

return M
