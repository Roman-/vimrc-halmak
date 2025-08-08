function SaveAndCloseBuffer()
    -- if insert mode, exit insert mode first
    if vim.fn.mode() == 'i' then
        vim.cmd('stopinsert')
    end

    -- if buffer is modified and its type is not none, save changes
    if vim.bo.modified and vim.bo.buftype ~= 'nofile' then
        vim.cmd('w!')
    end

    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    if #bufs == 1 then
        vim.cmd('q!')
    else
        vim.cmd('BufferClose')
    end
end

function MoveFileToTrash()
    vim.cmd('w')
    local val = vim.fn.input('Move "' .. vim.fn.expand('%') .. '" to trash? [y]es/[N]o? ')
    if val:lower() ~= 'y' then
        print('cancelled')
        return
    end
    local fname = vim.fn.expand('%:p')

    vim.cmd('sav! /tmp/deleted_buffer.txt')
    vim.fn.delete(fname)
    vim.cmd('silent bwipeout!') -- /tmp/deleted_buffer
    vim.cmd('e ' .. fname) -- Open the file again
    vim.cmd('silent bwipeout!') -- Deleted buffer

    print('File moved to /tmp/deleted_buffer.txt')
end

function RenameCurrentFile()
    vim.cmd('w')

    local current_name = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local ext_with_dot = extension ~= '' and '.' .. extension or ''

    -- Pre-populate the input with the file extension and position the cursor before it
    if #ext_with_dot > 0 then
        vim.schedule(function()
            local move_left = string.rep('<Left>', #ext_with_dot)
            local keys = vim.api.nvim_replace_termcodes(move_left, true, false, true)
            vim.api.nvim_feedkeys(keys, 'c', false)
        end)
    end

    local new_name = vim.fn.input('Rename ' .. current_name .. ': ', ext_with_dot)

    -- Check if a file with the new name already exists
    if vim.fn.filereadable(new_name) == 1 then
        print('Error: File "' .. new_name .. '" already exists in the current directory.')
        return
    end

    if new_name == '' then
        print('cancelled')
        return
    end

    -- Save the current buffer under the new name
    local old_path = vim.fn.expand('%:p')
    local new_path = vim.fn.expand('%:p:h') .. '/' .. new_name
    local success = pcall(vim.cmd, 'saveas ' .. new_path)

    if not success then
        print('Error: Unable to save the file as "' .. new_name .. '".')
        return
    end

    -- Open the new buffer, then wipe out the old one
    vim.cmd('e ' .. new_path)
    vim.cmd('e ' .. old_path)
    vim.cmd('silent bwipeout!')

    -- Delete the old file
    vim.fn.delete(old_path)
    print('File renamed to "' .. new_name .. '".')
end

function CloseOtherTabsButKeepIndex()
    vim.cmd('wa!')
    local current_buf = vim.api.nvim_get_current_buf()
    local index_buf = vim.fn.bufnr('index.md')
    if index_buf == -1 then
        vim.cmd('VimwikiIndex')
        index_buf = vim.api.nvim_get_current_buf()
    end
    if current_buf == index_buf then
        vim.cmd('BufferCloseAllButCurrent')
        return
    end
    local state = require('barbar.state')
    vim.cmd('buffer ' .. index_buf)
    local was_pinned = state.is_pinned(index_buf)
    if not was_pinned then
        vim.cmd('BufferPin')
    end
    vim.cmd('buffer ' .. current_buf)
    vim.cmd('BufferCloseAllButCurrentOrPinned')
    vim.cmd('buffer ' .. index_buf)
    if not was_pinned then
        vim.cmd('BufferPin')
    end
    vim.cmd('buffer ' .. current_buf)
end

function ExportFileToClipboard()
    local path = vim.fn.expand('%:p')
    local ext = vim.fn.expand('%:e')
    local content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')
    vim.fn.setreg('+', path .. '\n```' .. ext .. '\n' .. content .. '\n```')
end
