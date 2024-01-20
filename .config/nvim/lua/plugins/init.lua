local plugins = {

    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    -- Themes
    { 'yazeed1s/oh-lucy.nvim' },
    { 'kdheepak/monochrome.nvim' },
    { "EdenEast/nightfox.nvim" },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },

    {
        'https://github.com/adelarsq/image_preview.nvim',
        event = 'VeryLazy',
        config = function()
            require("image_preview").setup()
        end
    },
    {
        "niuiic/code-shot.nvim",
        dependencies = {
            "niuiic/core.nvim"
        },
        config = function()
            require("code-shot").setup({
                ---@return string output file path
                output = function()
                    local core = require("core")
                    local buf_name = vim.api.nvim_buf_get_name(0)
                    return core.file.name(buf_name) .. ".png"
                end,
                ---@return string[]
                -- select_area: {s_start: {row: number, col: number}, s_end: {row: number, col: number}} | nil
                options = function(select_area)
                    if not select_area then
                        return {}
                    end
                    return {
                        "--line-offset",
                        select_area.s_start.row,
                    }
                end,
            })
        end
    },
    -- lazy.nvim
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add any options here
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     },
    -- config = function()
    --     require("noice").setup({
    --         lsp = {
    --             -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --             -- override = {
    --             --     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --             --     ["vim.lsp.util.stylize_markdown"] = true,
    --             --     -- ["cmp.entry.get_documentation"] = true,
    --             -- },
    --         },
    --         -- you can enable a preset for easier configuration
    --         presets = {
    --             bottom_search = true,     -- use a classic bottom cmdline for search
    --             command_palette = true,   -- position the cmdline and popupmenu together
    --             long_message_to_split = true, -- long messages will be sent to a split
    --             inc_rename = false,       -- enables an input dialog for inc-rename.nvim
    --             -- lsp_doc_border = false,   -- add a border to hover docs and signature help
    --         },
    --     })
    -- end,
    -- },
    -- {
    --     "folke/which-key.nvim",
    --     event = "VeryLazy",
    --     init = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --     end,
    --     opts = {
    --         -- your configuration comes here
    --         -- or leave it empty to use the default settings
    --         -- refer to the configuration section below
    --     }
    -- },
    {
        'stevearc/dressing.nvim',
        config = function()
            require('plugins.configs.dressing')
        end
    },

    {
        "ahmedkhalf/project.nvim",
        lazy = false,
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

    -- fill git integration in neovim
    {
        "chrisgrieser/nvim-tinygit",
        ft = { "gitrebase", "gitcommit" }, -- so ftplugins are loaded
        dependencies = {
            "stevearc/dressing.nvim",
            -- "nvim-telescope/telescope.nvim", -- either telescope or fzf-lua
            "ibhagwan/fzf-lua",
            "rcarriga/nvim-notify", -- optional, but will lack some features without it
        },
    },

    {
        "rcarriga/nvim-notify", -- optional, but will lack some features without it
        config = function()
            require("notify").setup {
                -- stages = 'fade_in_slide_out',
                -- background_colour = 'FloatShadow',
                -- timeout = 3000,
            }
            vim.notify = require('notify')
        end

    },

    -- { 'nvim-telescope/telescope-dap.nvim' },

    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "mason.nvim",
            "mfussenegger/nvim-dap",
        },
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
            },
        },
    },

    {
        'brenoprata10/nvim-highlight-colors',
        lazy = false,
        config = function()
            require('nvim-highlight-colors').setup {}
        end
    },

    -- :SymbolsOutline -> get list of symobls

    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("symbols-outline").setup()
        end,
    },

    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = "VeryLazy",
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },


    {
        'stevearc/oil.nvim',
        config = function()
            require("oil").setup()
        end,
    },

    {
        "NvChad/nvterm",
        config = function()
            require("nvterm").setup()
        end,
    },

    {
        "iamcco/markdown-preview.nvim",
        lazy = true,
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        config = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require("plugins.configs.nvim-tree");
        end,
    },

    -- icons, for UI related plugins
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },

    -- syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    },

    -- buffer + tab line
    {
        "akinsho/bufferline.nvim",
        event = "BufReadPre",
        config = function()
            require "plugins.configs.bufferline"
        end,
    },


    {
        'echasnovski/mini.nvim',
        version = false,
    },

    {
        'f-person/git-blame.nvim',
        -- enabled = false,
        config = function()
            require('gitblame').setup()
        end,
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require "plugins.configs.lualine"
        end,
    },

    -- we use cmp plugin only when in insert mode
    -- so lets lazyload it at InsertEnter event, to know all the events check h-events
    -- completion , now all of these plugins are dependent on cmp, we load them after cmp
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- cmp sources
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",

            -- snippets
            --list of default snippets
            "rafamadriz/friendly-snippets",

            -- snippets engine
            {
                "L3MON4D3/LuaSnip",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },

            -- autopairs , autocompletes ()[] etc
            -- "windwp/nvim-autopairs",
            -- {
            --     config = function()
            --         require("nvim-autopairs").setup()
            --
            --         --  cmp integration
            --         local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            --         local cmp = require "cmp"
            --         cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            --     end,
            -- },
        },
        config = function()
            require "plugins.configs.cmp"
        end,
    },

    -- Mason (package manager for LSP servers, Linters, Formatters, DAP servers)
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonInstall" },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "plugins.configs.lspconfig"
        end,
    },

    -- formatting , linting
    {
        "stevearc/conform.nvim",
        lazy = true,
        config = function()
            require "plugins.configs.conform"
        end,
    },

    -- indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        char = "|",
        tab_char = { "a", "b", "c" },
        highlight = { "Function", "Label" },
        smart_indent_cap = true,
        priority = 2,
        config = function()
            require("ibl").setup()
        end,
    },

    {
        "ibhagwan/fzf-lua",
        config = function()
            require("plugins.configs.fzf-lua")
        end,
    },

    -- files finder etc
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require "plugins.configs.telescope"
        end,
    },

    -- git status on signcolumn etc
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- comment plugin
    {
        "numToStr/Comment.nvim",
        lazy = true,
        config = function()
            -- require('Comment').setup()
        end,
    },

    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            require "lsp_signature".on_attach()
        end,
    },
}

require("lazy").setup(plugins, require "plugins.configs.lazy")

require("plugins.configs.lsp-signature")
