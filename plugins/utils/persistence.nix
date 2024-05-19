{ svlib, ... }:
{
  plugins.persistence = {
    enable = true;
  };

  keymaps = svlib.createKeymaps "n" {
    "<leader>qs" = {
      action = ''<cmd>lua require("persistence").load()<cr>'';
      desc = "Restore the last session for the current directory";
    };

    "<leader>ql" = {
      action = ''<cmd>lua require("persistence").load({ last = true })<cr>'';
      desc = "Restore the last session";
    };

    "<leader>qd" = {
      action = ''<cmd>lua require("persistence").stop()<cr>'';
      desc = "Stop Persistence (session won't be saved on exit)";
    };
  };
}
