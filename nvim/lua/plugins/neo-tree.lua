return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
          side = "left",
          mappings = {
            list = {
              { key = "l",    action = "edit" },
              { key = "h",    action = "close_node" },
              { key = "<CR>", action = "cd" },
              { key = "o",    action = "system_open" },
              { key = "v",    action = "vsplit" },
              { key = "s",    action = "split" },
              { key = "t",    action = "tabnew" },
            },
          },
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_open = "",
                arrow_closed = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          }
        },
        settings = {
          sort_by = "case_sensitive",
          sort_mru = true,
          ignore_ft_on_setup = {
            "startify",
            "dashboard",
            "alpha",
            "NvimTree",
            "Outline",
            "spectre_panel",
          },
          hijack_netrw = true,
          open_on_setup = false,
          ignore_buffer_on_setup = true,
          open_on_tab = false,
          hijack_cursor = false,
          update_cwd = false,
          update_to_buf_dir = {
            enable = true,
            auto_open = true,
          },
          diagnostics = {
            enable = false,
            show_on_dirs = false,
            icons = {
              hint = "",
              info = "",
              warning = "",
              error = "",
            },
          },
          git = {
            enable = true,
            ignore = true,
            timeout = 200,
          },
          view = {
            width = 30,
            side = "left",
            auto_resize = false,
            mappings = {
              custom_only = false,
              list = {
                { key = "l",    action = "edit" },
                { key = "h",    action = "close_node" },
                { key = "<CR>", action = "cd" },
                { key = "o",    action = "system_open" },
                { key = "v",    action = "vsplit" },
                { key = "s",    action = "split" },
                { key = "t",    action = "tabnew" },
              },
            },

            renderer = {
              highlight_git = true,
              icons = {
                show = {
                  file = true,
                  folder = true,
                  folder_arrow = true,
                  git = true,
                },
                glyphs = {
                  default = "",
                  symlink = "",
                  folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                  },
                  git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                  },
                },
              }
            },
            settings = {
              sort_by = "case_sensitive",
              sort_mru = true,
              ignore_ft_on_setup = {
                "startify",
                "dashboard",
                "alpha",
                "NvimTree",
                "Outline",
                "spectre_panel",
              },
              hijack_netrw = true,
              open_on_setup = false,
              ignore_buffer_on_setup = true,
              open_on_tab = false,
              hijack_cursor = false,
              update_cwd = false,
              update_to_buf_dir = {
                enable = true,
                auto_open = true,
              },
              diagnostics = {
                enable = false,
                show_on_dirs = false,
                icons = {
                  hint = "",
                  info = "",
                  warning = "",
                  error = "",
                },
              },
              git = {
                enable = true,
                ignore = true,
                timeout = 200,
              },
              view = {
                width = 30,
                side = "left",
                auto_resize = false,
                mappings = {
                  custom_only = false,
                  list = {
                    { key = "l",                                                action = "edit" },
                    { key = "                                                ", action = "toggle_preview" },
                  },
                },
              },
            }
          }
        }
      })
    end,
  }
}
