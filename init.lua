return {
    -- Configure AstroNvim updates
    updater = {
        remote = "origin",     -- remote to use
        channel = "stable",    -- "stable" or "nightly"
        version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "nightly",    -- branch name (NIGHTLY ONLY)
        commit = nil,          -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false,  -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_quit = false,     -- automatically quit the current session after a successful update
        remotes = {            -- easily add new remotes to track
            --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
            --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
            --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        },
    },

    -- Set colorscheme to use
    -- colorscheme = "astrodark",
    colorscheme = "tokyonight",


    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
        virtual_text = true,
        underline = true,
    },

    lsp = {
        -- customize lsp formatting options
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = true,     -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    -- "go",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "python",
                },
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
                -- "lua_ls",
            },
            timeout_ms = 1000, -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- enable servers that you already have installed without mason
        servers = {
            -- "pyright"
        },
    },

    -- Configure require("lazy").setup() options
    lazy = {
        defaults = { lazy = true },
        performance = {
            rtp = {
                -- customize default disabled vim plugins
                disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
            },
        },
    },

    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function()
        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }
    end,
    plugins = {
        {
            "rebelot/heirline.nvim",
            opts = function(_, opts)
                local status = require "astronvim.utils.status"

                opts.winbar = { -- create custom winbar
                    -- store the current buffer number
                    init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
                    fallthrough = false, -- pick the correct winbar based on condition
                    -- inactive winbar
                    {
                        condition = function() return not status.condition.is_active() end,
                        -- show the path to the file relative to the working directory
                        status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
                        -- add the file name and icon
                        status.component.file_info {
                            file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
                            file_modified = false,
                            file_read_only = false,
                            hl = status.hl.get_attributes("winbarnc", true),
                            surround = false,
                            update = "BufEnter",
                        },
                    },
                    -- active winbar
                    {
                        -- show the path to the file relative to the working directory
                        status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
                        -- add the file name and icon
                        status.component.file_info { -- add file_info to breadcrumbs
                            file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
                            file_modified = false,
                            file_read_only = false,
                            hl = status.hl.get_attributes("winbar", true),
                            surround = false,
                            update = "BufEnter",
                        },
                        -- show the breadcrumbs
                        status.component.breadcrumbs {
                            icon = { hl = true },
                            hl = status.hl.get_attributes("winbar", true),
                            prefix = true,
                            padding = { left = 0 },
                        },
                    },
                }

                return opts
            end,
        },
    },
}
