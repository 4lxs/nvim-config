{
  autoCmd = [
    # Remove trailing whitespace on save
    {
      event = "BufWrite";
      command = "%s/\\s\\+$//e";
    }

    # Open help in a vertical split
    {
      event = "FileType";
      pattern = "help";
      command = "wincmd L";
    }

    # Set indentation to 2 spaces for nix files
    {
      event = "FileType";
      pattern = "nix";
      command = "setlocal tabstop=2 shiftwidth=2";
    }

    # Highlight on yank
    {
      event = "TextYankPost";
      pattern = "*";
      command =
        "silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=200})";
    }

    # Enable spellcheck for some filetypes
    {
      event = "FileType";
      pattern = [ "tex" "latex" "markdown" ];
      command = "setlocal spell spelllang=en";
    }

    # Auto create dir when saving a file, in case some intermediate directory does not exist
    {
      event = "BufWritePre";
      callback.__raw = ''
        function(event)
          if event.match:match("^%w%w+://") then
            return
          end
          local file = vim.uv.fs_realpath(event.match) or event.match
          vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
        end
      '';
    }
  ];
}
