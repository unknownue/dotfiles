
-- -----------------------------------------------------------------------------------
-- Colemak keymapping for neovim
-- 
--  _   _                 _               ____      _                      _
-- | \ | | ___  _____   _(_)_ __ ___     / ___|___ | | ___ _ __ ___   __ _| | __
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \   | |   / _ \| |/ _ \ '_ ` _ \ / _` | |/ /
-- | |\  |  __/ (_) \ V /| | | | | | |  | |__| (_) | |  __/ | | | | | (_| |   <
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|   \____\___/|_|\___|_| |_| |_|\__,_|_|\_\
--
--
-- -----------------------------------------------------------------------------------

-- To see how to deine key mapping, see https://github.com/nanotee/nvim-lua-guide#defining-mappings

-- Use ":help keycodes" to see all key notation
-- :h key-notation
-- <ESC> -> Escape
-- <CR>  -> Enter
-- <C-?> -> Ctrl
-- <S-?> -> Shift
-- <D-?> -> Command
-- <M-?> or <A-?> -> Alt/Option

-- use space as a the leader key
vim.g.mapleader = ' '

-- Map but not used ------------------------------------------------------
vim.api.nvim_set_keymap('n', 'g', 't', {noremap = true})
vim.api.nvim_set_keymap('n', 'G', 'T', {noremap = true})
vim.api.nvim_set_keymap('n', 'r', 's', {noremap = true})
vim.api.nvim_set_keymap('n', 'R', 'S', {noremap = true})


-- Movement --------------------------------------------------------------
-- Up/down/left/right
-- vim.api.nvim_set_keymap('', 'h', 'h', {noremap = true})  -- left
vim.api.nvim_set_keymap('', 'n', 'j', {noremap = true})  -- down
vim.api.nvim_set_keymap('', 'e', 'k', {noremap = true})  -- up
vim.api.nvim_set_keymap('', 'i', 'l', {noremap = true})  -- right
-- Move cursor faster
vim.api.nvim_set_keymap('', '<S-n>', '4j', {noremap = true})
vim.api.nvim_set_keymap('', '<S-e>', '4k', {noremap = true})

-- Words forward/backward
-- vim.api.nvim_set_keymap('', 'b', 'b', {noremap = true});  -- back word
-- vim.api.nvim_set_keymap('', 'B', 'B', {noremap = true});  -- back word
vim.api.nvim_set_keymap('', 'f', 'e', {noremap = true})  -- next word end
vim.api.nvim_set_keymap('', 'F', 'E', {noremap = true})  -- next word end
-- vim.api.nvim_set_keymap('', 'w', 'w', {noremap = true})  -- next word start
-- vim.api.nvim_set_keymap('', 'W', 'W', {noremap = true})  -- next word start

-- Search
if vim.g.vscode then
    -- Ues build-in function in vscode
    vim.api.nvim_set_keymap('o', 'g', 't', {noremap = true})  -- -> until char
    vim.api.nvim_set_keymap('o', 'G', 'T', {noremap = true})  -- <- until char
    vim.api.nvim_set_keymap('n', '<C-t>', "<cmd>lua vim.call('VSCodeCall', 'action.find')", { noremap = true, silent = true })  -- Ctrl + f to search in current file
else
    -- vim.api.nvim_set_keymap('n', 'o', ';', {noremap = true})  -- just to next search
    -- vim.api.nvim_set_keymap('n', 'O', ':', {noremap = true})  -- 
    vim.api.nvim_set_keymap('n', 'k', 'n', {noremap = true})  -- find next
    vim.api.nvim_set_keymap('n', 'K', 'N', {noremap = true})  -- find previous
    vim.api.nvim_set_keymap('n', 't', 'f', {noremap = true})  -- Search to line right (start operator-pending)
    vim.api.nvim_set_keymap('n', 'T', 'F', {noremap = true})  -- Search to line left (stat operator-pending)
    vim.api.nvim_set_keymap('n', 't', 'f', {noremap = true})  -- Search to line right (during operator-pending)
    vim.api.nvim_set_keymap('n', 'T', 'F', {noremap = true})  -- Search to line left (during operator-pending)
    vim.api.nvim_set_keymap('n', '=', 'nzz', {noremap = true})  -- jump to next search
    vim.api.nvim_set_keymap('n', '-', 'Nzz', {noremap = true})  -- jump to previous search
    vim.api.nvim_set_keymap('', 'g', 't', {noremap = true})  -- -> until char
    vim.api.nvim_set_keymap('', 'G', 'T', {noremap = true})  -- <- until char
end


-- Edit ------------------------------------------------------------------
-- Undo/Redo
-- Please use cmd + z and cmd + shift + z in macos
if vim.g.vscode then
    -- vim.api.nvim_set_keymap('n', 'z', "<cmd>lua vim.call('VSCodeCall', 'undo')<CR>", {noremap = true})  -- too slow to execute
else
    vim.api.nvim_set_keymap('n', 'z', 'u', {noremap = true})          -- undo
    vim.api.nvim_set_keymap('n', '<S-z>', '<C-r>', {noremap = true})  -- redo    
end

-- Use q to save file
if vim.g.vscode then
    vim.api.nvim_set_keymap('n', 'q', "<cmd>lua vim.call('VSCodeCall', 'workbench.action.files.save')<CR>", {noremap = true})
else
    vim.api.nvim_set_keymap('n', 'q', ':w<CR>', {noremap = true})
end

-- Copy/Paste
-- Examples:
--     yi{ -> yand inside {}
--     yw  -> yand word after cursor
--     yaw -> yand a word
vim.api.nvim_set_keymap('n', 'j', 'y', {noremap = true})    -- switch to yand pending state
vim.api.nvim_set_keymap('v', 'j', 'y', {noremap = true})    -- copy visual selection
vim.api.nvim_set_keymap('n', 'J', 'Y', {noremap = true})    -- copy line
vim.api.nvim_set_keymap('n', 'l', 'p', {noremap = true})    -- paste to next line
vim.api.nvim_set_keymap('n', 'L', 'P', {noremap = true})    -- paste to preview line
vim.api.nvim_set_keymap("o", 'u', 'i', {noremap = true})    -- copy inside something

-- Change
-- Examples:
--     ci{ -> change inside {}
--     cw  -> change word after cursor
--     caw -> change a word
vim.api.nvim_set_keymap('o', "u", "i", {noremap = true})    -- change inside something ({} or "" or (), or [])

-- Insert/Replace/Append/Delete/Open line/Goto
-- Exmaples:
--     di{ -> delete inside {}
--     dw  -> delete word after cursor
--     daw -> deletd a word
--     D   -> delete all after cursor
--     i   -> insert at cursor
--     I   -> insert at line beginning (with indent support)
--     r   -> replace a character
--     R   -> replace starts from cursor
--     gg  -> jump to start of file
--     G   -> jump to end of file
vim.api.nvim_set_keymap('n', 'u', 'i', {noremap = true})  -- change to insert mode at cursor position
vim.api.nvim_set_keymap('n', 'U', 'I', {noremap = true})  -- change to insert mode at line beginning
-- vim.api.nvim_set_keymap('n', 'a', 'a', {noremap = true})  -- change to insert mode at next cursor positon
-- vim.api.nvim_set_keymap('n', 'A', 'A', {noremap = true})  -- change to insert mode at line ending
vim.api.nvim_set_keymap('n', 'p', 'r', {noremap = true})  -- replace a character
vim.api.nvim_set_keymap('n', 'P', 'R', {noremap = true})  -- Set to replace mode at current cursor
-- vim.api.nvim_set_keymap('n', 'x', 'x', {noremap = true})  -- delete character at cursor position
vim.api.nvim_set_keymap('n', 's', 'd', {noremap = true})  -- delete (start operator-pending)
vim.api.nvim_set_keymap('o', 's', 'd', {noremap = true})  -- delete (during operator-pending)
vim.api.nvim_set_keymap('x', 's', 'd', {noremap = true})  -- delete visual selection
vim.api.nvim_set_keymap('n', 'S', 'D', {noremap = true})  -- delete from cursor to line ending
vim.api.nvim_set_keymap('n', '<CR>', 'o', {noremap = true})  -- change to insert mode and open new line at next line of current cursor
vim.api.nvim_set_keymap('n', '<S-CR>', 'O', {noremap = true})  -- change to insert mode and open new line at the previous line of current cursor
-- vim.api.nvim_set_keymap('n', 'd', 'g', {noremap = true})  -- goto (start operator-pending)
-- vim.api.nvim_set_keymap('x', 'd', 'g', {noremap = true})  -- goto (during operator-pending)
vim.api.nvim_set_keymap('n', 'D', 'G', {noremap = true})     -- jump to file eof
vim.api.nvim_set_keymap('n', 'dd', 'gg', {noremap = true})   -- jump to start of file


-- New line
vim.api.nvim_set_keymap('n', 'o', 'mpo<Esc>`p', {noremap = true})  -- insert new line at next line (keep normal mode & cursor)
vim.api.nvim_set_keymap('n', 'O', 'mpO<Esc>`p', {noremap = true})  -- insert new line at above line (keep normal mode & cursor)

-- Comment
if vim.g.vscode then
    -- From https://github.com/asvetliakov/vscode-neovim/issues/199#issuecomment-640284496
    vim.api.nvim_set_keymap('x', '<C-/>', '<Plug>(VSCodeCommentary)gv',   { silent = true, noremap = true })
    vim.api.nvim_set_keymap('n', '<C-/>', '<Plug>(VSCodeCommentary)Line', { noremap = true, silent = true })
else
    -- Use vim-commentary plugin
    -- TODO
end

-- Move code up/down
-- No good solution yet (Use vscode selection instead (insert mode))


-- Plugins ---------------------------------------------------------------
-- config for splitjoin
vim.api.nvim_set_keymap('n', '<leader><down>', 'gJ', { noremap = true, silent = true })  -- split a one-liner into multiple lines
vim.api.nvim_set_keymap('n', '<leader><up>',   'gS', { noremap = true, silent = true })  -- join a block into a single-line statement
-- config for sideways
vim.api.nvim_set_keymap('n', '<leader><left>',  ':SidewaysLeft<CR>',  { noremap = true, silent = true }) -- move parameter to left
vim.api.nvim_set_keymap('n', '<leader><right>', ':SidewaysRight<CR>', { noremap = true, silent = true }) -- move parameter to right
-- config for vim-easy-align
vim.api.nvim_set_keymap('x', '<leader>-', '<Plug>(EasyAlign)',  { noremap = true, silent = true }) -- enter align mode from visual mode
vim.api.nvim_set_keymap('x', '<leader>=', '<Plug>(EasyAlign)=', { noremap = true, silent = true }) -- align by '=' from visual mode


-- Custom ---------------------------------------------------------------- 
-- Swap 0 and ^ functionality in operator-pending mode
-- vim.api.nvim_set_keymap('o', '0', '^', {noremap = true})
-- vim.api.nvim_set_keymap('o', '^', '0', {noremap = true})

-- toggle hightlight
if vim.g.vscode then
    vim.api.nvim_set_keymap('n', '<leader><CR>', ':set hlsearch!<CR>', { noremap = true, silent = true })
end

-- Use Q to record macro
vim.api.nvim_set_keymap('n', 'Q', 'q', {noremap = true})
--------------------------------------------------------------------------
