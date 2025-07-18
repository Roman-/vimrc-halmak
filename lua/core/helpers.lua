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
    local new_name = vim.fn.input('Rename "' .. current_name .. '" (with extension!) to: ')

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
