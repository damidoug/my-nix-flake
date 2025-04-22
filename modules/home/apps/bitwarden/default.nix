{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.apps.bitwarden;
in {
  options.${namespace}.apps.bitwarden = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.bitwarden-desktop];
    programs.brave.extensions = ["nngceckbapebfimnlniiiahkandclblb"];
  };
}
