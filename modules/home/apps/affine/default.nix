{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.apps.affine;
in {
  options.${namespace}.apps.affine = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.affine];
  };
}
