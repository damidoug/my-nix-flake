{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.coding.tools.git;
in {
  options.${namespace}.coding.tools.git = with types; {
    enable = mkBoolOpt false "Enable git, an distributed version control system.";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
      userName = "damidoug";
      userEmail = "contact@damidoug.dev";
      aliases = {
        ci = "commit";
        co = "checkout";
        s = "status";
      };
      extraConfig = {
        credential.helper =
          if pkgs.stdenv.isDarwin
          then "osxkeychain"
          else "libsecret";
      };
    };
  };
}
