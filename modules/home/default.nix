{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; {
  config = {
    # Enable a fontconfig configuration file will be built pointing to a set of default fonts
    fonts.fontconfig.enable = true;
    programs = {
      home-manager.enable = mkDefault true;
      nix-index.enable = true;
      # Shells prompts
      bash.enable = true;
      zsh = {
        enable = pkgs.stdenv.isDarwin;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
      };
    };

    # nix = {
    #   #package = lib.mkDefault pkgs.lix;
    #   # gc = {
    #   #   automatic = true;
    #   #   options = "--delete-older-than 7d";
    #   # };
    #   settings = {
    #     experimental-features = lib.mkDefault [
    #       "nix-command"
    #       "flakes"
    #     ];
    #     allowed-users = lib.mkDefault [ "*" ];
    #     trusted-users = lib.mkDefault [
    #       "root"
    #       "@wheel"
    #       "@admin"
    #     ];
    #     sandbox = true;
    #     auto-optimise-store = true;
    #     keep-outputs = true;
    #     keep-derivations = true;
    #   };
    # };

    xdg.enable = true;

    targets.genericLinux.enable = !pkgs.stdenv.isDarwin && !builtins.pathExists "/etc/NIXOS";

    home = {
      shellAliases.switch = "home-manager switch --flake";
      stateVersion = lib.mkDefault (config.system.stateVersion or "24.11");
    };
  };
}
