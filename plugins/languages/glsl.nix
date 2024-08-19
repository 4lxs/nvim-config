{ pkgs, lib, ... }:
{
  plugins = {
    lsp.enabledServers = [
      {
        name = "glslls";
        extraOptions = {
          cmd = [
            (lib.getExe pkgs.glslls)
            "--stdin"
          ];
          filetypes = [ "glsl" ];
          single_file_support = true;
          capabilities = {
            textDocument.completion.editsNearCursor = true;
            offsetEncoding = [
              "utf-8"
              "utf-16"
            ];
          };
        };
      }
    ];
  };

  extraConfigLua = ''
    vim.filetype.add({
      -- Detect and assign filetype based on the extension of the filename
      extension = {
        vert = "glsl",
        frag = "glsl",
        comp = "glsl",
        geom = "glsl",
      },
    })
  '';
}
