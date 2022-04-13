local M = {}

function M.config()
  local status_ok, _ = pcall(require, "Glow")
  if not status_ok then
    return
  end
end

return M
