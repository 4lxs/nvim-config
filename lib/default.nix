{lib, ...}: {
  createKeymaps = modes: keymaps: let
    modesChars = lib.stringToCharacters modes;
  in
    lib.lists.flatten
    (map (mode:
      lib.mapAttrsToList (key: val:
        if lib.isString val
        then {
          inherit key mode;
          action = val;
          options = {
            noremap = true;
            silent = true;
          };
        }
        else {
          inherit key mode;
          inherit (val) action;
          lua = val.lua or false;
          options =
            {
              noremap = true;
              silent = true;
              inherit (val) desc;
            }
            // val.options or {};
        })
      keymaps)
    modesChars);
}
