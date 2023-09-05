---@type MappingsTable
local M = {}
-- M.disabled = {
--   n = {
--       ["<tab>"] = ""
--   }
-- }


M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      "Copilot Accept",
      {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    }
  }
}
-- more keybinds!

M.my = {
  n = {
  -- Split window
  ["<leader>ss"] = {   ":split<Return><C-w>w", "Split Window" },
  ["<leader>sv"] = {   ":vsplit<Return><C-w>w", "Vertical Split Window" },

  -- new tab
  ["tn"] = {   ":tabnew<Return>", "New Tab" },
  }
}
return M
