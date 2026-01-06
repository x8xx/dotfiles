local actions = require("telescope.actions")

require("telescope").setup({
    pickers = {
        find_files = {
            -- trueは重いなぁ
            -- no_ignore = true,
            no_ignore = false,
            hidden = true,
        },
       live_grep = {
            only_sort_text = false
        }
    },
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
          ".*venv/",
          "node_modules/",
          "__pycache__/",
          ".tmp/",
          ".github/.*_results/"
        },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            hide_parent_dir = true,
            hidden = { file_browser = true, folder_browser = true },
            depth = 1,
            mappings = {
                ["i"] = {
                    ["<Esc>"] = function()
                        vim.cmd("message 'File Browser'")
                    end,
                },
            }
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
