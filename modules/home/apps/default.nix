{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.apps;
in {
  options.${namespace}.apps = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      bitwarden-desktop
      vesktop
      spotube
      (mkIf pkgs.stdenv.isDarwin utm)
    ];
    programs.brave = {
      enable = true;
      commandLineArgs = [
        "--disable-browser-signin"
        "--disable-sync"
        "--disable-password-manager"
        "--enable-spellcheck"
        "--spell-checker=dictionary=en-US,pt-BR"
      ];
      extensions = [
        # bitwarden
        "nngceckbapebfimnlniiiahkandclblb"
        # Vencord
        "cbghhgpcnddeihccjmnadmkaejncjndb"
      ];
    };
    home.sessionVariables.BROWSER = "brave";
  };
}
