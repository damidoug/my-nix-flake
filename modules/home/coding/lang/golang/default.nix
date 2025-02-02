{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.coding.lang.golang;
in {
  options.${namespace}.coding.lang.golang = with types; {
    enable = mkBoolOpt false "Enable Go Programming language.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gopls
      air
      go-swag
    ];
    programs.go.enable = true;
  };
}
