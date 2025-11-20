return {
  -- LSP 基础
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- 可选：让 LSP 与补全协同（若你用 nvim-cmp）
      { "hrsh7th/cmp-nvim-lsp", optional = true },

      -- 可选：用 Mason 自动安装 rust-analyzer
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- 补全集成（若未装 cmp-nvim-lsp，给一个空能力以避免报错）
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- 通用 on_attach：键位 & inlay hints
      local on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "LSP: Go to Definition")
        map("n", "gD", vim.lsp.buf.declaration, "LSP: Go to Declaration")
        map("n", "gi", vim.lsp.buf.implementation, "LSP: Go to Impl")
        map("n", "gr", vim.lsp.buf.references, "LSP: References")
        map("n", "K",  vim.lsp.buf.hover, "LSP: Hover")
        map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: Code Action")
        map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "LSP: Format")

        -- inlay hints（NVIM ≥0.10）
        if vim.lsp.inlay_hint then
          vim.lsp.inlay_hint(bufnr, true)
          map("n", "<leader>ih", function()
            local enabled = vim.lsp.inlay_hint.is_enabled(bufnr)
            vim.lsp.inlay_hint(bufnr, not enabled)
          end, "LSP: Toggle Inlay Hints")
        end
      end

      -- rust-analyzer 设置
      local ra_settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            -- 若工作区较大可开启：
            -- buildScripts = { enable = true },
          },
          checkOnSave = {
            command = "clippy",
            extraArgs = { "--no-deps" },
          },
          inlayHints = {
            lifetimeElisionHints = { enable = true, useParameterNames = true },
            parameterHints = { enable = true },
            typeHints = { enable = true },
          },
          diagnostics = {
            enable = true,
          },
        },
      }

      -- 方式 A：用 mason 自动安装 & 启动
      local ok_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")
      if ok_mason_lsp then
        mason_lsp.setup({ ensure_installed = { "rust_analyzer" } })
        mason_lsp.setup_handlers({
          function(server)
            if server == "rust_analyzer" then
              lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = ra_settings,
              })
            else
              lspconfig[server].setup({
                capabilities = capabilities,
                on_attach = on_attach,
              })
            end
          end,
        })
      else
        -- 方式 B：不用 mason，直接用系统里的 rust-analyzer
        -- 确保已安装：`rustup component add rust-analyzer` 或自行放到 PATH
        lspconfig.rust_analyzer.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = ra_settings,
        })
      end
    end,
  },
}
