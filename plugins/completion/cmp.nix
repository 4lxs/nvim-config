{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;

      cmdline = {
        "/" = {
          mapping.__raw = "cmp.mapping.preset.cmdline()";
          sources = [ { name = "buffer"; } ];
        };
        ":" = {
          mapping.__raw = "cmp.mapping.preset.cmdline()";
          sources = [
            { name = "path"; }
            {
              name = "cmdline";
              option = {
                ignore_cmds = [
                  "Man"
                  "!"
                ];
              };
            }
          ];
        };
      };

      settings = {
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
          };
          documentation = {
            border = "rounded";
          };
        };

        performance = {
          # fetchingTimeout = 200;
          maxViewEntries = 30;
        };

        experimental = {
          ghost_text = true;
        };

        mapping = {
          "<Tab>" = ''
            function(fallback)
              local luasnip = require("luasnip")
              local cmp = require("cmp")
              if cmp.visible() then
                if luasnip.expandable() then
                  luasnip.expand()
                else
                  print("cmp complete")
                  cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
                end
              elseif luasnip.jumpable(1) then
                luasnip.jump(1)
              end
            end
          '';
          "<S-Tab>" = ''
            function(fallback)
              local luasnip = require("luasnip")
              if luasnip.jumpable(-1) then
                luasnip.jump(-1)
              end
            end
          '';
          "<c-n>" = "cmp.mapping(cmp.mapping.select_next_item())";
          "<c-p>" = "cmp.mapping(cmp.mapping.select_prev_item())";
          "<c-e>" = "cmp.mapping.abort()";
        };

        sources = [
          { name = "git"; }
          { name = "luasnip"; }
          { name = "nvim_lsp"; }
          { name = "crates"; }
          {
            name = "copilot";
            max_item_count = 1;
          }
          # { name = "mkdnflow"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
      };

      filetype = {
        sql = {
          sources = [
            { name = "buffer"; }
            { name = "vim-dadbod-completion"; }
          ];
        };
      };
    };
    cmp-nvim-lsp.enable = true; # lsp
    cmp-buffer.enable = true;
    copilot-cmp.enable = true; # copilot suggestions
    cmp-path.enable = true; # file system paths
    cmp_luasnip.enable = true; # snippets
    cmp-cmdline.enable = true; # autocomplete for cmdline
    cmp-git.enable = true; # git issues, prs
  };
}
