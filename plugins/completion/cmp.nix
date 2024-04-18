{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;

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
          { name = "nvim_lsp"; }
          # { name = "mkdnflow"; }
          { name = "buffer"; }
          { name = "copilot"; }
          { name = "path"; }
          { name = "luasnip"; }
        ];
        # TODO: clangd_extensions doesn't work
        # sorting.comparators = [
        #   "require('cmp.config.compare').offset"
        #   "require('cmp.config.compare').exact"
        #   "require('cmp.config.compare').score"
        #   "require('cmp.config.compare').recently_used"
        #   "require('clangd_extensions.cmp_scores')" # not part of cmp
        #   "require('cmp.config.compare').locality"
        #   "require('cmp.config.compare').kind"
        #   "require('cmp.config.compare').length"
        #   "require('cmp.config.compare').order"
        # ];
      };
    };
    cmp-nvim-lsp.enable = true; # lsp
    cmp-buffer.enable = true;
    copilot-cmp.enable = true; # copilot suggestions
    cmp-path.enable = true; # file system paths
    cmp_luasnip.enable = true; # snippets
    cmp-cmdline.enable = true; # autocomplete for cmdline
  };
}
