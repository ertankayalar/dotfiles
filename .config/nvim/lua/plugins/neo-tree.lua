return {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    cmd = "Neotree",
    keys = {
        {"<leader>ft", "<cmd>Neotree toggle<cr>", desc="NeoTree" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
        filesystem = {
            follow_current_file = true,
            hijack_netrw_behavior = "open_current",
        window = {
          mappings = {
            ["<F5>"] = "refresh",
            ["o"] = "open",
          }
        }
        },
        window = {
          position = 'left',
        },
    }
  }
