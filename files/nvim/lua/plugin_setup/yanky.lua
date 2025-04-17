local utils = require("yanky.utils")
local mapping = require("yanky.telescope.mapping")

require("yanky").setup({
      ring = {
        history_length = 200,
        storage = "shada",
        sync_with_numbered_registers = true,
        cancel_event = "update",
        update_register_on_cycle = true,
      },
      picker = {
        select = {
          action = nil, -- nil to use default put action
        },
        telescope = {
          use_default_mappings = true, -- if default mappings should be used
          mappings = {
              i = {
                  ["<c-x>"] = mapping.delete(),
                  ["<c-r>"] = mapping.set_register(utils.get_default_register()),
              },
          },
        },
      },
      system_clipboard = {
        sync_with_ring = true,
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 500,
      },
      preserve_cursor_position = {
        enabled = true,
      }
})
