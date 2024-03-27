{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        snippet.expand = "luasnip"; # require('luasnip').lsp_expand(args.body)
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
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };

        experimental = {
          ghost_text = true;
        };

        mapping = {
          "<tab>" = "cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })";
          # "<Tab>" = ''
          #   function(fallback)
          #     if cmp.visible() then
          #         cmp.select_next_item()
          #     elseif luasnip.expand_or_jumpable() then
          #         luasnip.expand_or_jump()
          #     end
          #   end
          # '';
          # "<S-Tab>" = ''
          #   function(fallback)
          #     if luasnip.jumpable(-1) then
          #       luasnip.jump(-1)
          #     end
          #   end
          # '';
          # "<C-e>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<c-n>" = "cmp.mapping(cmp.mapping.select_next_item())";
          "<c-p>" = "cmp.mapping(cmp.mapping.select_prev_item())";
          "<C-Space>" = "cmp.mapping.complete()";
        };

        sources = [
          {name = "nvim_lsp";}
          {name = "mkdnflow";}
          {name = "buffer";}
          {name = "copilot";}
          {name = "path";}
          {name = "luasnip";}
        ];
      };
    };
    cmp-nvim-lsp = {enable = true;}; # lsp
    cmp-buffer = {enable = true;};
    copilot-cmp = {enable = true;}; # copilot suggestions
    cmp-path = {enable = true;}; # file system paths
    cmp_luasnip = {enable = true;}; # snippets
    cmp-cmdline = {enable = true;}; # autocomplete for cmdline
  };
}
