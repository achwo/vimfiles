return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          jump_prev = false,
          jump_next = false,
          accept = "<C-J>",
          refresh = false,
          open = false
        }
      },
      panel = { enabled = false },
      -- filetypes = {
      --   markdown = true,
      --   help = true,
      -- },
    },
  },
  -- {
  --   "nvim-cmp",
  --   dependencies = {
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       dependencies = "copilot.lua",
  --       opts = {},
  --       config = function(_, opts)
  --         local copilot_cmp = require("copilot_cmp")
  --         copilot_cmp.setup(opts)
  --       end,
  --     },
  --   },
  -- },
}

