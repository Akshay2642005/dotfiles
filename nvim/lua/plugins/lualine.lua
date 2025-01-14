return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = function()
    local lualine = require("lualine")
    local function loadcolors()
      -- Rose-pine palette
      local rosepine = require("rose-pine.palette")
      local colors = {
        bg = rosepine.base,
        fg = rosepine.text,
        yellow = rosepine.gold,
        cyan = rosepine.foam,
        black = rosepine.subtled,
        green = rosepine.pine,
        white = rosepine.text,
        magenta = rosepine.iris,
        blue = rosepine.rose,
        red = rosepine.love
      }
      return colors
    end

    local colors = loadcolors()

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        globalstatus = true,
        component_separators = "",
        section_separators = "",
        disabled_filetypes = { "Lazy", "NvimTree" },
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = {
            c = {
              fg = colors.fg,
              bg = "#1e1e1e"
            }
          },
          inactive = {
            c = {
              fg = colors.fg,
              bg = "#1e1e1e"
            }
          }
        }
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {}
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {}
      },
      tabline = {},
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x ot right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left {
      -- mode component
      function()
        return " "
      end,
      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = colors.red,
          i = colors.green,
          v = colors.blue,
          [""] = colors.blue,
          V = colors.blue,
          c = colors.magenta,
          no = colors.red,
          s = colors.yellow,
          S = colors.yellow,
          [""] = colors.yellow,
          ic = colors.yellow,
          R = colors.white,
          Rv = colors.white,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ["r?"] = colors.cyan,
          ["!"] = colors.red,
          t = colors.red
        }
        return {
          fg = mode_color[vim.fn.mode()]
        }
      end
    }

    ins_left {
      "filename",
      cond = conditions.buffer_not_empty,
      path = 1,
      color = {
        gui = "bold"
      }
    }

    ins_left {
      "branch",
      icon = " ",
      color = {
        gui = "bold"
      }
    }

    ins_left {
      "diff",
      -- Is it me or the symbol for modified us really weird
      symbols = {
        added = " ",
        modified = " ",
        removed = " "
      },
      diff_color = {
        added = {
        },
        modified = {
        },
        removed = {
        }
      },
      cond = conditions.hide_in_width
    }

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it"s any number greater then 2
    ins_left { function()
      return "%="
    end }

    ins_right {
      -- Lsp server name .
      function()
        local msg = "null"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = " LSP:",
      color = {
        gui = "bold"
      }
    }

    ins_right {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = {
        error = " ",
        warn = " ",
        info = " ",
        hints = "󰛩 ",
      },
      diagnostics_color = {
        color_error = {
          fg = colors.red
        },
        color_warn = {
          fg = colors.yellow
        },
        color_info = {
          fg = colors.cyan
        },
        color_hints = {
          fg = colors.magenta
        }
      },
      always_visible = true
    }

    --[[     ins_right {
      "fileformat",
      fmt = string.upper,
      icons_enabled = true,
      color = {
        fg = colors.green,
        gui = "bold"
      }
    }
    ins_right {
      "location",
      color = {
        fg = colors.fg,
        gui = "bold"
      }
    }

    ins_right {
      "progress",
      color = {
        fg = colors.fg,
        gui = "bold"
      }
    } ]]

    -- Now don"t forget to initialize lualine
    lualine.setup(config)
  end
}
