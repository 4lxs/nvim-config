{
  plugins.telescope = {
    enable = true;

    extensions = {
      fzf-native.enable = true;
      ui-select = {
        settings = {
          specific_opts = {
            codeactions = true;
          };
        };
      };
      undo.enable = true;
    };

    settings.defaults = {
      mappings = {
        i = {
          "<esc>" = {
            __raw = ''
              function(...)
                return require("telescope.actions").close(...)
              end'';
          };
          "<c-t>" = {
            __raw = ''
              function(...)
                require('trouble.providers.telescope').open_with_trouble(...);
              end
            '';
          };
        };
        n = {
          "<c-t>" = {
            __raw = ''
              function(...)
                require('trouble.providers.telescope').open_with_trouble(...);
              end
            '';
          };
        };
      };

      # trim leading whitespace from grep
      vimgrep_arguments = [
        "rg"
        "--color=never"
        "--no-heading"
        "--with-filename"
        "--line-number"
        "--column"
        "--smart-case"
        "--trim"
      ];
    };

    keymaps = {

      # files
      "<leader><space>" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>/" = {
        action = "live_grep";
        options.desc = "Grep (root dir)";
      };
      "<leader>fr" = {
        action = "oldfiles";
        options.desc = "Recent";
      };

      # vim
      "<leader>:" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Buffers";
      };
      "<leader>fa" = {
        action = "autocommands";
        options.desc = "Auto Commands";
      };
      "<leader>fc" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader>fC" = {
        action = "commands";
        options.desc = "Commands";
      };
      "<leader>fh" = {
        action = "help_tags";
        options.desc = "Help pages";
      };
      "<leader>fH" = {
        action = "highlights";
        options.desc = "Search Highlight Groups";
      };
      "<leader>fk" = {
        action = "keymaps";
        options.desc = "Keymaps";
      };
      "<leader>fM" = {
        action = "man_pages";
        options.desc = "Man pages";
      };
      "<leader>fm" = {
        action = "marks";
        options.desc = "Jump to Mark";
      };
      "<leader>fo" = {
        action = "vim_options";
        options.desc = "Options";
      };
      "<leader>fR" = {
        action = "resume";
        options.desc = "Resume";
      };
      "<leader>uC" = {
        action = "colorscheme";
        options.desc = "Colorscheme preview";
      };

      # git
      "<leader>gb" = {
        action = "git_branches";
        options.desc = "Git branches";
      };
      "<leader>fgc" = {
        action = "git_commits";
        options.desc = "Commits";
      };
      "<leader>fgs" = {
        action = "git_status";
        options.desc = "Status";
      };

      # lsp
      "<leader>fx" = {
        action = "diagnostics, { bufnr = 0 }";
        options.desc = "Workspace diagnostics";
      };
      "<leader>fX" = {
        action = "diagnostics";
        options.desc = "Workspace diagnostics";
      };
      "<leader>ss" = {
        action = "lsp_document_symbols";
        options.desc = "Lsp document symbols";
      };
      "<leader>sS" = {
        action = "lsp_dynamic_workspace_symbols";
        options.desc = "Lsp workspace symbols";
      };
      "gd" = {
        action = "lsp_definitions";
        options.desc = "Lsp definitions";
      };
      "gy" = {
        action = "lsp_type_definitions";
        options.desc = "Lsp type definitions";
      };
      "gr" = {
        action = "lsp_references";
        options.desc = "Lsp references";
      };
      "gi" = {
        action = "lsp_implementations";
        options.desc = "Lsp implementations";
      };
    };
  };
}
