{
  plugins.mini = {
    enable = true;
    modules = {
      comment = {
        options = {
          custom_commentstring.__raw = ''
            function()
              return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
            end
          '';
        };
      };
      cursorword = { };
    };
  };
}
