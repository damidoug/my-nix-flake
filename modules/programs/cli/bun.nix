{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.bun";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs = {
      bun = {
        enable = true;
        settings = {
          smol = true;
          telemetry = false;
        };
      };
      zed-editor.extensions = ["biome" "vue"];
    };
    home.packages = with pkgs; [nodejs biome];
  };
}
