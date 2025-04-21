{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.developer.go;
in {
  options.${namespace}.developer.go = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    programs.go = {
      enable = true;
      goPath = "Developer/.go";
    };
    home.packages = with pkgs; [
      air
      gopls
    ];
  };
}
