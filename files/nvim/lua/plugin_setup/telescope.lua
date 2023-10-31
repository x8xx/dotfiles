local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<TAB>"] = actions.select_tab,
                ["<C-S>"] = actions.select_horizontal,
                ["<C-w>"] = actions.send_to_qflist
            }
        }
    },
    extensions = {
        file_browser = {
            depth = 1,
        }
    }
})
