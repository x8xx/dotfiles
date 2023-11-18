function delete_this_window_buffer()
    local current_buffer_id = vim.api.nvim_win_get_buf(0)
    if vim.api.nvim_buf_get_option(current_buffer_id, 'modified') then
        print('ちゃんと保存してね 🐈')
        return
    end

    local buffers = vim.api.nvim_list_bufs()
    for i, bid in ipairs(buffers) do
        if bid ~= current_buffer_id then
            vim.api.nvim_win_set_buf(0, bid)
            vim.api.nvim_buf_delete(current_buffer_id, { force = false })
            break
        end
    end
end

vim.api.nvim_create_user_command('Bd', delete_this_window_buffer, { nargs = 0 })
