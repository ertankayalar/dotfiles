---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- more keybinds!

M.my = {
  n = {
  -- Split window
  ["<leader>s"] = {   ":split<Return><C-w>w", "Split Window" },
  ["<leader>v"] = {   ":vsplit<Return><C-w>w", "Vertical Split Window" },

  -- new tab
  ["tn"] = {   ":tabnew<Return>", "New Tab" },
  }
}
return M
