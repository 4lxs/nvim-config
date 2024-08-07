{ lib, ... }:
{
  createKeymaps =
    modes: keymaps:
    let
      modesChars = lib.stringToCharacters modes;
    in
    lib.lists.flatten (
      map (
        mode:
        lib.mapAttrsToList (
          key: val:
          if lib.isString val then
            {
              inherit key mode;
              action = val;
              options = {
                noremap = true;
                silent = true;
              };
            }
          else
            {
              inherit key mode;
              inherit (val) action;
              options = {
                noremap = true;
                silent = true;
                desc = val.desc or null;
              } // val.options or { };
            }
        ) keymaps
      ) modesChars
    );
}
