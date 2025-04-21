{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.shell;
in {
  options.${namespace}.shell = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    ${namespace}.shell = {
      bash.enable = true; # linux and macos has bash installed by default
      zsh.enable = pkgs.stdenv.isDarwin; # true on darwin systems
    };
  };
}
