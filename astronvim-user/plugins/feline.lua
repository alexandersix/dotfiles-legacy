return function(config)
  local provider = require("core.status").provider

  local function TableConcat(t1,t2)
    for i=1,#t2 do
      t1[#t1+1] = t2[i]
    end
    return t1
  end
  -- new beginning of the statusline
  local new_left = {
    { provider = provider.spacer() },
    {
      provider = function() return vim.fn.expand("%:t:r") .. "." .. vim.fn.expand("%:e") end,
    },
  }

  -- extend the new left with the old left component
  -- vim.list_extend(new_left, config.components.active[1])
  local new_active = TableConcat(config.components.active[1], new_left)
  -- set the new left as the  active component
  config.components.active[1] = new_active

  return config
end
