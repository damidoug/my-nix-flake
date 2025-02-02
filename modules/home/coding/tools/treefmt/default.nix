{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.coding.tools.treefmt;
in {
  options.${namespace}.coding.tools.treefmt = with types; {
    enable = mkBoolOpt false "Enable module.";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.treefmt];
  };
}
