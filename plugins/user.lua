return { -- You can also add new plugins here as well:
    -- Add plugins, the lazy syntax
    -- "andweeb/presence.nvim",
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        event = "User AstroFile",
        cmd = { "ToduQuickFix" },
        keys = { {
            "<leader>T",
            "<cmd>TodoTelescope<cr>",
            desc = "Open Todo Telescope"
        } }
    },
    {
        'tomasky/bookmarks.nvim',
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
            keywords = {
                ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
                ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
                ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
                ["@n"] = " " -- mark annotation startswith @n ,signs this icon as `Note`
            }
            -- on_attach = function(bufnr)
            --     local bm = require "bookmarks"
            --     local map = vim.keymap.set
            --     map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
            --     map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
            --     map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
            --     map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
            --     map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
            --     map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
            -- end
        },
        event = "User AstroFile",
        cmd = { "Bookmarks" }
    },
    {
        'linux-cultist/venv-selector.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
        config = function()
            require('venv-selector').setup {
                -- Your options go here
                -- name = "venv",
                -- auto_refresh = false
            }
        end,
        event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
        keys = {
            -- Keymap to open VenvSelector to pick a venv.
            { '<leader>vs', '<cmd>VenvSelect<cr>' },
            -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
            { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
        },
    },
    {
        "LunarVim/bigfile.nvim",
        opts = {
            filesize = 2,      -- size of the file in MiB, the plugin round file sizes to the closest MiB
            pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
            features = {       -- features to disable
                "indent_blankline",
                "illuminate",
                "lsp",
                "treesitter",
                "syntax",
                "matchparen",
                "vimopts",
                "filetype",
            },
        },
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    -- {
    --   "folke/edgy.nvim",
    --   event = "VeryLazy",
    --   init = function()
    --     vim.opt.laststatus = 3
    --     vim.opt.splitkeep = "screen"
    --   end,
    --   opts = {
    --     bottom = {
    --       -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
    --       {
    --         ft = "toggleterm",
    --         size = { height = 0.4 },
    --         -- exclude floating windows
    --         filter = function(buf, win)
    --           return vim.api.nvim_win_get_config(win).relative == ""
    --         end,
    --       },
    --       {
    --         ft = "lazyterm",
    --         title = "LazyTerm",
    --         size = { height = 0.4 },
    --         filter = function(buf)
    --           return not vim.b[buf].lazyterm_cmd
    --         end,
    --       },
    --       "Trouble",
    --       { ft = "qf", title = "QuickFix" },
    --       {
    --         ft = "help",
    --         size = { height = 20 },
    --         -- only show help buffers
    --         filter = function(buf)
    --           return vim.bo[buf].buftype == "help"
    --         end,
    --       },
    --       { ft = "spectre_panel", size = { height = 0.4 } },
    --     },
    --     left = {
    --       -- Neo-tree filesystem always takes half the screen height
    --       {
    --         title = "Neo-Tree",
    --         ft = "neo-tree",
    --         filter = function(buf)
    --           return vim.b[buf].neo_tree_source == "filesystem"
    --         end,
    --         size = { height = 0.5 },
    --       },
    --       {
    --         title = "Neo-Tree Git",
    --         ft = "neo-tree",
    --         filter = function(buf)
    --           return vim.b[buf].neo_tree_source == "git_status"
    --         end,
    --         pinned = true,
    --         open = "Neotree position=right git_status",
    --       },
    --       {
    --         title = "Neo-Tree Buffers",
    --         ft = "neo-tree",
    --         filter = function(buf)
    --           return vim.b[buf].neo_tree_source == "buffers"
    --         end,
    --         pinned = true,
    --         open = "Neotree position=top buffers",
    --       },
    --       {
    --         ft = "Outline",
    --         pinned = true,
    --         open = "SymbolsOutlineOpen",
    --       },
    --       -- any other neo-tree windows
    --       "neo-tree",
    --     },
    --   },
    -- },
}
