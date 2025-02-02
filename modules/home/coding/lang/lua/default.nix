{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.coding.lang.lua;
in {
  options.${namespace}.coding.lang.lua = with types; {
    enable = mkBoolOpt false "Enable rust, an safe, concurrent, practical language.";
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.lua
    ];
    programs.zed-editor.extensions = ["lua"];
  };
}
