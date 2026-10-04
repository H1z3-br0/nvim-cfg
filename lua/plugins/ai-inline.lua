return {
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      disable_inline_completion = false,
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<M-f>",
      },
      ignore_filetypes = {
        "bigfile",
        "snacks_dashboard",
        "snacks_input",
        "snacks_notif",
      },
      color = {
        suggestion_color = "#6c7086",
        cterm = 244,
      },
      log_level = "off",
    },
    config = function(_, opts)
      require("supermaven-nvim").setup(opts)
      local ok, suggestion = pcall(require, "supermaven-nvim.completion_preview")
      if ok then
        suggestion.suggestion_group = "SupermavenSuggestion"
        vim.api.nvim_set_hl(0, "SupermavenSuggestion", { fg = "#6c7086", italic = true })
      end
      vim.schedule(function()
        vim.keymap.set("i", "<Tab>", function()
          local has_cmp, cmp = pcall(require, "blink.cmp")
          if has_cmp and cmp.is_visible and cmp.is_visible() then
            return "<Tab>"
          end
          local has_suggestion, sm = pcall(require, "supermaven-nvim.completion_preview")
          if has_suggestion and sm.has_suggestion() then
            sm.on_accept_suggestion()
            return ""
          end
          return "<Tab>"
        end, { expr = true, silent = true, desc = "Accept Supermaven Suggestion" })
        vim.keymap.set("i", "<M-]>", function()
          local has_suggestion, sm = pcall(require, "supermaven-nvim.completion_preview")
          if has_suggestion and sm.has_suggestion() and sm.on_next_suggestion then
            sm.on_next_suggestion()
            return ""
          end
          return "<M-]>"
        end, { expr = true, silent = true, desc = "Next Supermaven Suggestion" })
        vim.keymap.set("i", "<M-[>", function()
          local has_suggestion, sm = pcall(require, "supermaven-nvim.completion_preview")
          if has_suggestion and sm.has_suggestion() and sm.on_prev_suggestion then
            sm.on_prev_suggestion()
            return ""
          end
          return "<M-[>"
        end, { expr = true, silent = true, desc = "Prev Supermaven Suggestion" })
      end)
    end,
  },

  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        ["<CR>"] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_and_accept()
            end
          end,
          "fallback",
        },
        ["<C-y>"] = { "select_and_accept" },
      },
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
}
