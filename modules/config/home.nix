{
  delib,
  pkgs,
  lib,
  ...
}: let
  isDarwin = pkgs.stdenv.isDarwin;
  isNixos = builtins.pathExists "/etc/NIXOS";

  homeSettings = {
    backupFileExtension = "old";
    useUserPackages = true;
    useGlobalPkgs = true;
    verbose = true;
  };
in
  delib.module {
    name = "home";

    home.always = {myconfig, ...}: let
      inherit (myconfig.constants) username;
      homeDir =
        if isDarwin
        then "/Users/${username}"
        else "/home/${username}";
    in {
      home = {
        inherit username;
        homeDirectory = lib.mkForce homeDir;
      };

      programs.home-manager.enable = true;
      xdg.enable = true;

      targets.genericLinux.enable = !(isDarwin || isNixos);
    };

    nixos.always.home-manager = homeSettings;
    darwin.always.home-manager = homeSettings;
  }
