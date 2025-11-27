-- ===========================================
-- 1. 基础引导 (Lazy.nvim 安装)
-- ===========================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
                   lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- ===========================================
-- 2. 插件配置
-- ===========================================
require("lazy").setup({ -- === 核心开发体验优化 ===
{
    "folke/lazydev.nvim", -- 【替换了 neodev】
    ft = "lua", -- 仅在 lua 文件加载
    opts = {
        library = {{
            path = "luvit-meta/library",
            words = {"vim%.uv"}
        }}
    }
}, {
    "Bilal2453/luvit-meta",
    lazy = true
}, -- 配合 lazydev
-- === UI 与 工具 ===
{"folke/which-key.nvim"}, {'airblade/vim-gitgutter'}, {
    'junegunn/fzf',
    build = "./install --all"
}, {'junegunn/fzf.vim'}, {'mechatroner/rainbow_csv'}, {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {}
}, {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'}, -- 需要安装 Nerd Fonts 字体
    config = function()
        require('lualine').setup({
            options = {
                theme = 'tokyonight', -- 直接适配你已经安装的主题
                component_separators = '|',
                section_separators = ''
            }
        })
    end
}, {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate"
},
{
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp"},
    config = function()
        -- 1. 初始化 Mason (负责下载二进制文件)
        require("mason").setup()

        -- 2. 准备 capabilities (为了让补全引擎 nvim-cmp 生效)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- 3. 使用 Mason-LSPConfig 的 handlers 自动配置
        -- 这是目前最稳妥的写法，它会自动处理 setup 调用，避免你手动写 lspconfig.setup 导致报错
        require("mason-lspconfig").setup({
            ensure_installed = {"clangd", "lua_ls", "rust_analyzer"}, -- 自动安装 C++ 和 Lua 服务
            handlers = {
                -- 默认处理器：适用于大多数语言
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities
                    })
                end,

                -- C++ 专用处理器 (clangd)
                ["clangd"] = function()
                    require("lspconfig").clangd.setup({
                        capabilities = capabilities,
                        cmd = {"clangd", "--background-index", -- 后台建立索引，让跳转更快
                        "--clang-tidy", -- 开启静态检查
                        "--header-insertion=iwyu", -- 自动头文件导入
                        "--completion-style=detailed", "--function-arg-placeholders", "--fallback-style=llvm"},
                        init_options = {
                            usePlaceholders = true,
                            completeUnimported = true,
                            clangdFileStatus = true
                        }
                    })
                end,

                -- Lua 专用处理器 (避免把 Neovim 配置当成普通 Lua 项目报错)
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                workspace = {
                                    checkThirdParty = false
                                },
                                telemetry = {
                                    enable = false
                                }
                            }
                        }
                    })
                end,
                -- === 新增：Rust 专用配置 ===
                ["rust_analyzer"] = function()
                    require("lspconfig").rust_analyzer.setup({
                        capabilities = capabilities,
                        settings = {
                            ["rust-analyzer"] = {
                                -- 开启 Clippy 检查 (代替默认的 cargo check)
                                checkOnSave = {
                                    command = "clippy"
                                },
                                -- 各种类型提示的微调
                                inlayHints = {
                                    bindingModeHints = {
                                        enable = false
                                    },
                                    chainingHints = {
                                        enable = true
                                    },
                                    closingBraceHints = {
                                        enable = true,
                                        minLines = 25
                                    },
                                    closureReturnTypeHints = {
                                        enable = "always"
                                    },
                                    lifetimeElisionHints = {
                                        enable = "never"
                                    },
                                    parameterHints = {
                                        enable = true
                                    },
                                    renderColons = true,
                                    typeHints = {
                                        enable = true,
                                        hideClosureInitialization = false,
                                        hideNamedConstructor = false
                                    }
                                }
                            }
                        }
                    })
                end
            }
        })
    end
}, -- === 自动补全 (UI 部分) ===
{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "L3MON4D3/LuaSnip",
                    "saadparwaiz1/cmp_luasnip"},
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({
                    select = true
                }),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item()
            }),
            sources = cmp.config.sources({{
                name = 'nvim_lsp'
            }, {
                name = 'luasnip'
            }, {
                name = 'path'
            }}, {{
                name = 'buffer'
            }})
        })
    end
}})

-- ===========================================
-- 3. 快捷键配置 (Native LspAttach)
-- ===========================================
-- Neovim v0.10+ / v0.11 推荐方式：仅在 LSP 启动成功后绑定按键
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = {
            buffer = ev.buf
        }
        -- 常用跳转
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- 帮助信息
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- 代码操作
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format {
                async = true
            }
        end, opts)

        -- 错误诊断跳转
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        if client and client.server_capabilities.inlayHintProvider then
            -- 这里的 enable 函数在 Neovim 0.10+ 中可用
            vim.lsp.inlay_hint.enable(true, {
                bufnr = ev.buf
            })
        end
    end
})

-- 加载你原来的旧配置 (如果有的话)
require('basic')
