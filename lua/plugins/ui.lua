return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local colors = require("cyberdream.colors").default
      local cyberdream = require("lualine.themes.cyberdream")
      local copilot_colors = {
        [""] = { fg = colors.grey, bg = colors.none },
        ["Normal"] = { fg = colors.grey, bg = colors.none },
        ["Warning"] = { fg = colors.red, bg = colors.none },
        ["InProgress"] = { fg = colors.yellow, bg = colors.none },
      }
      return {
        options = {
          component_separators = { left = " ", right = " " },
          section_separators = { left = " ", right = " " },
          theme = cyberdream,
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = { { "mode", icon = "" } },
          lualine_b = { { "branch", icon = "" } },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = "󰝶 ",
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            {
              "filename",
              symbols = { modified = "  ", readonly = "", unnamed = "" },
            },
            {
              function()
                return require("nvim-navic").get_location()
              end,
              cond = function()
                return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
              end,
              color = { fg = colors.grey, bg = colors.none },
            },
          },
          lualine_x = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = colors.green },
            },
            {
              function()
                local icon = " "
                local status = require("copilot.api").status.data
                return icon .. (status.message or "")
              end,
              cond = function()
                local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
                return ok and #clients > 0
              end,
              color = function()
                if not package.loaded["copilot"] then
                  return
                end
                local status = require("copilot.api").status.data
                return copilot_colors[status.status] or copilot_colors[""]
              end,
            },
            { "diffss" },
          },
          lualine_y = {
            {
              "progress",
            },
            {
              "location",
              color = { fg = colors.cyan, bg = colors.none },
            },
          },
          lualine_z = {
            function()
              return "  " .. os.date("%X") .. " 🚀 "
            end,
          },
        },

        extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
      }
    end,
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   optional = true,
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     local Util = require("lazyvim.util")
  --     local colors = {
  --       [""] = Util.ui.fg("Special"),
  --       ["Normal"] = Util.ui.fg("Special"),
  --       ["Warning"] = Util.ui.fg("DiagnosticError"),
  --       ["InProgress"] = Util.ui.fg("DiagnosticWarn"),
  --     }
  --     table.insert(opts.sections.lualine_x, 2, {
  --       function()
  --         local icon = require("lazyvim.config").icons.kinds.Copilot
  --         local status = require("copilot.api").status.data
  --         return icon .. (status.message or "")
  --       end,
  --       cond = function()
  --         if not package.loaded["copilot"] then
  --           return
  --         end
  --         local ok, clients = pcall(require("lazyvim.util").lsp.get_clients, { name = "copilot", bufnr = 0 })
  --         if not ok then
  --           return false
  --         end
  --         return ok and #clients > 0
  --       end,
  --       color = function()
  --         if not package.loaded["copilot"] then
  --           return
  --         end
  --         local status = require("copilot.api").status.data
  --         return colors[status.status] or colors[""]
  --       end,
  --     })
  --   end,
  -- },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "echasnovski/mini.starter",
    event = "VimEnter",
    opts = function()
      local logo = table.concat({
        [[
        ░█████╗░░█████╗░████████╗░█████╗░  ██████╗░███████╗██╗░░░██╗
        ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗  ██╔══██╗██╔════╝██║░░░██║
        ██║░░╚═╝███████║░░░██║░░░██║░░██║  ██║░░██║█████╗░░╚██╗░██╔╝
        ██║░░██╗██╔══██║░░░██║░░░██║░░██║  ██║░░██║██╔══╝░░░╚████╔╝░
        ╚█████╔╝██║░░██║░░░██║░░░╚█████╔╝  ██████╔╝███████╗░░╚██╔╝░░
        ░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░  ╚═════╝░╚══════╝░░░╚═╝░░░
        ]],
      }, "\n")
      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end
      local test = require("lazyvim.util")
      print(test)
      local starter = require("mini.starter")
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          new_section(
            "Find file",
            "Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍",
            "Telescope"
          ),
          new_section("Recent files", "Telescope oldfiles", "Telescope"),
          new_section("Grep text", "Telescope live_grep", "Telescope"),
          new_section("Config", "lua require('lazyvim.util').telescope.config_files()", "Config"),
          new_section("Extras", "LazyExtras", "Config"),
          new_section("Lazy", "Lazy", "Config"),
          new_section("New file", "ene | startinsert", "Built-in"),
          new_section("Quit", "qa", "Built-in"),
          new_section("Session restore", [[lua require("persistence").load()]], "Session"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
  },
}
