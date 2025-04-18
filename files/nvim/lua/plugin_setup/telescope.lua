local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<TAB>"] = actions.select_tab,
                ["<C-S>"] = actions.select_horizontal,
                ["<C-w>"] = actions.send_to_qflist
            }
        },
        file_ignore_patterns = {
          "^.git/",
        },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            hide_parent_dir = true,
            depth = 1,
        },
        ast_grep = {
            command = {
                "sg",
                "--json=stream",
            }, -- must have --json=stream
            grep_open_files = false, -- search in opened files
            lang = nil, -- string value, specify language for ast-grep `nil` for default
        }
    }
})
