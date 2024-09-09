return {
  "monkoose/neocodeium",
  cmd = "NeoCodeium",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>u!"] = {
          function()
            require("neocodeium.commands").toggle()
            vim.cmd.redrawstatus()
          end,
          desc = "Toggle AI assistant",
        }
        maps.n["<M-CR>"] = { function() require("neocodeium").chat() end }
        maps.i["<M-]>"] = { function() require("neocodeium").cycle_or_complete() end }
        maps.i["<M-\\>"] = maps.i["<M-]>"]
        maps.i["<M-[>"] = { function() require("neocodeium").cycle_or_complete(-1) end }
        maps.i["<M-CR>"] = { function() require("neocodeium").accept() end }
        maps.i["<M-BS>"] = { function() require("neocodeium").clear() end }
      end,
    },
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require "astroui.status"

        table.insert(
          opts.statusline,
          10,
          status.component.builder {
            {
              provider = function()
                local aistatus, serverstatus = require("neocodeium").get_status()
                return status.utils.stylize(
                  (aistatus ~= 0 and "󱚧") or (serverstatus == 0 and "󰚩" or "󱚢"),
                  { padding = { right = 1 } }
                )
              end,
            },
            hl = { fg = "git_branch_fg" },
            surround = {
              separator = "right",
              color = "section_bg",
              condition = function() return vim.g.neocodeium_enabled end,
            },
          }
        )
      end,
    },
  },
  opts = {
    enabled = false,
    manual = true,
    silent = true,
    filetypes = {
      TelescopePrompt = false,
      ["dap-repl"] = false,
    },
  },
}
