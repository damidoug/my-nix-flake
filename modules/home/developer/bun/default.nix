{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.developer.bun;
in {
  options.${namespace}.developer.bun = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
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
    home.packages = [
      pkgs.biome
    ];
  };
}
