{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.developer.rust;
in {
  options.${namespace}.developer.rust = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.rustup];
    programs.zed-editor.extensions = ["toml"];
  };
}
