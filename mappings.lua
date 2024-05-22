-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
    -- local bm = require "bookmarks"
    -- first key is the mode
    n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<leader>bn"] = {
            "<cmd>tabnew<cr>",
            desc = "New tab"
        },
        ["<leader>bD"] = {
            function()
                require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
                    require("astronvim.utils.buffer").close(bufnr)
                end)
            end,
            desc = "Pick to close"
        },

        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = {
            name = "Buffers"
        },

        -- quick save
        ["<C-s>"] = {
            ":w!<cr>",
            desc = "Save File"
        }, -- change description but the same command

        -- bookmark
        ["mm"] = {
            function()
                require("bookmarks").bookmark_toggle()
            end,
            desc = "add or remove bookmark at current line"
        },
        ["mi"] = {
            function()
                require("bookmarks").bookmark_ann()
            end,
            desc = "add or edit mark annotation at current line"
        },
        ["mc"] = {
            function()
                require("bookmarks").bookmark_clean()
            end,
            desc = "clean all marks in local buffer"
        },
        ["mn"] = {
            function()
                require("bookmarks").bookmark_next()
            end,
            desc = "jump to next mark in local buffer"
        },
        ["mp"] = {
            function()
                require("bookmarks").bookmark_prev()
            end,
            desc = "jump to previous mark in local buffer"
        },
        ["ml"] = {
            function()
                require("bookmarks").bookmark_list()
            end,
            desc = "show marked file list in quickfix window"
        }

        -- ["<leader>vl"]={":lua require('vscode').load('light')<cr>",desc="use vscode-light theme"},
        -- ["<leader>vd"]={":lua require('vscode').load('dark')<cr>",desc="use vscode-dark theme"},

    },
    t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
    }
}
