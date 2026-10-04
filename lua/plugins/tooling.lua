return {
  {
    "mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "black",
        "eslint_d",
        "prettier",
        "ruff",
        "shellcheck",
        "shfmt",
        "stylua",
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "prettier" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        fish = { "fish" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        python = { "ruff" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      },
    },
  },
}
