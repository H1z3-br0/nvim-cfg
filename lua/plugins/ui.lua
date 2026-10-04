return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      dim_inactive = {
        enabled = false,
      },
      float = {
        transparent = false,
        solid = false,
      },
      term_colors = true,
      integrations = {
        alpha = true,
        blink_cmp = true,
        gitsigns = true,
        mason = true,
        mini = { enabled = true },
        native_lsp = { enabled = true },
        noice = true,
        snacks = true,
        treesitter = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          CursorLineNr = { fg = colors.peach, style = { "bold" } },
          FloatBorder = { fg = colors.surface2 },
          LineNr = { fg = colors.overlay0 },
          NeoTreeNormal = { bg = colors.base },
          PmenuSel = { bg = colors.surface0, style = { "bold" } },
          SnacksIndent = { fg = colors.surface0 },
          SnacksIndentScope = { fg = colors.lavender },
          WinSeparator = { fg = colors.surface1 },
        }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.component_separators = { left = "│", right = "│" }
      opts.options.section_separators = { left = "", right = "" }
      opts.sections.lualine_z = opts.sections.lualine_z or {}
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.separator_style = "slant"
      opts.options.show_buffer_close_icons = false
      opts.options.show_close_icon = false
      opts.options.always_show_bufferline = true
      opts.options.offsets = opts.options.offsets or {}
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.presets = vim.tbl_deep_extend("force", opts.presets or {}, {
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      })
      opts.cmdline = {
        view = "cmdline_popup",
      }
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.win = {
        border = "rounded",
        padding = { 1, 2 },
        title = false,
      }
    end,
  },

  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = {
        preset = {
          header = [[
 ██████╗ ██████╗ ██████╗ ███████╗██╗  ██╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝╚██╗██╔╝
██║     ██║   ██║██║  ██║█████╗   ╚███╔╝
██║     ██║   ██║██║  ██║██╔══╝   ██╔██╗
╚██████╗╚██████╔╝██████╔╝███████╗██╔╝ ██╗
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
          ]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = "󰱼 ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "t", desc = "Terminal", action = ":lua Snacks.terminal(nil, { cwd = LazyVim.root() })" },
            { icon = " ", key = "a", desc = "Claude Code", action = ":ClaudeCode" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Quick Actions", section = "keys", gap = 1, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", limit = 8, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", limit = 6, padding = 1 },
          { section = "startup" },
        },
      }
      opts.explorer = vim.tbl_deep_extend("force", opts.explorer or {}, {
        replace_netrw = true,
      })
      opts.indent = {
        enabled = true,
        animate = { enabled = false },
        scope = { enabled = true, underline = false },
      }
      opts.notifier = {
        enabled = true,
        timeout = 3000,
      }
      opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
        layouts = {
          default = {
            layout = {
              backdrop = false,
            },
          },
        },
        win = {
          input = {
            border = "rounded",
          },
          list = {
            border = "rounded",
          },
          preview = {
            border = "rounded",
          },
        },
      })
      opts.terminal = vim.tbl_deep_extend("force", opts.terminal or {}, {
        win = {
          border = "rounded",
        },
      })
    end,
  },
}
