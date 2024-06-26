{
  # we need to specify config due to options key
  globals = {
    loaded_ruby_provider = 0;
    loaded_perl_provider = 0;
    loaded_python_provider = 0;
  };

  clipboard = {

    # # Use system clipboard
    # see extraConfigLua
    # register = "unnamedplus";

    providers.wl-copy.enable = true;
    providers.xclip.enable = true;
  };

  opts = {
    updatetime = 100; # Faster completion

    conceallevel = 2;

    # Line numbers
    relativenumber = true; # Relative line numbers
    number = true; # Display the absolute line number of the current line
    hidden = true; # Keep closed buffer open in the background
    mouse = "a"; # Enable mouse control
    mousemodel = "extend"; # Mouse right-click extends the current selection
    splitbelow = true; # A new window is put below the current one
    splitright = true; # A new window is put right of the current one
    formatoptions = "jcroqlnt";

    swapfile = false; # Disable the swap file
    modeline = true; # Tags such as 'vim:ft=sh'
    modelines = 100; # Sets the type of modelines
    undofile = true; # Automatically save and restore undo history
    incsearch = true; # Incremental search: show match for partly typed
    # search command
    inccommand = "split"; # Search and replace: preview changes in quickfix list
    ignorecase = true; # When the search query is lower-case, match both lower and upper-case
    smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper
    scrolloff = 8; # Number of screen lines to show around the cursor
    cursorline = false; # Highlight the screen line of the cursor
    cursorcolumn = false; # Highlight the screen column of the cursor
    signcolumn = "yes"; # Whether to show the signcolumn
    # colorcolumn = "80"; # Columns to highlight
    laststatus = 3; # When to use a status line for the last window
    fileencoding = "utf-8"; # File-content encoding for the current buffer
    termguicolors = true; # Enables 24-bit RGB color in the |TUI|
    spell = false; # Highlight spelling mistakes (local to window)
    wrap = false; # Prevent text from wrapping

    # Tab options
    tabstop = 4; # Number of spaces a <Tab> in the text stands for (local to buffer)
    shiftwidth = 4; # Number of spaces used for each step of (auto)indent (local to buffer)
    expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
    autoindent = true; # Do clever autoindenting

    # textwidth = 80; # Maximum width of text that is being inserted.  A
    # longer line will be broken after white space to get this width.

    # Folding
    foldlevel = 99; # Folds with a level higher than this number will be closed

    grepprg = "rg --vimgrep";
    grepformat = "%f:%l:%c:%m";
  };

  extraConfigLua = ''
    if not vim.env.SSH_TTY then
      -- only set clipboard if not in ssh, to make sure the OSC 52
      -- integration works automatically. Requires Neovim >= 0.10.0
      vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
    end
  '';
}
