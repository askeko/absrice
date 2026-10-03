return {
  -- LazyVim already defaults to tokyonight; pick the night style
  {
    "folke/tokyonight.nvim",
    opts = { style = "night" },
  },

  -- harpoon2 extra (imported in config/lazy.lua), with the old add/menu keys;
  -- <leader>1-9 jump to files 1-9 as in the extra
  {
    "ThePrimeagen/harpoon",
    keys = function(_, keys)
      keys = vim.tbl_filter(function(key)
        return key[1] ~= "<leader>H" and key[1] ~= "<leader>h"
      end, keys)
      table.insert(keys, {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      })
      table.insert(keys, {
        "<C-e>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      })
      return keys
    end,
  },
}
