{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.coding.lang.rust;
in {
  options.${namespace}.coding.lang.rust = with types; {
    enable = mkBoolOpt false "Enable rust, an safe, concurrent, practical language.";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.rustup];
    programs.zed-editor.extensions = ["toml"];
  };
}
