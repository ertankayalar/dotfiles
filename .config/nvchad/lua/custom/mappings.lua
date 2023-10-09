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
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
    ["<C-k>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Reject"](), "")
      end,
      "Copilot Reject",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
    ["<C-j>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Cancel"](), "")
      end,
      "Copilot Cancel",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
    -- create copilot next suggestion mapping
    ["<F12>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Next"](), "")
      end,
      "Copilot Next Suggestion",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
    -- create copilot previous suggestion mapping
    ["<F11>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Previous"](), "")
      end,
      "Copilot Previous Suggestion",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
    -- more keybinds!
    -- <C-l> - accepts the suggestion
    -- <C-k> - rejects the suggestion
    -- <C-j> - cancels the suggestion
    -- <C-n> - cycles through suggestions
  },
}

M.my = {
  n = {
    -- Split window
    ["<leader>ss"] = { ":split<Return><C-w>w", "Split Window" },
    ["<leader>sv"] = { ":vsplit<Return><C-w>w", "Vertical Split Window" },

    -- new tab
    ["tn"] = { ":tabnew<Return>", "New Tab" },
  },
}
return M
