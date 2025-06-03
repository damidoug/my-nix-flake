{
  delib,
  pkgs,
  ...
}: let
  homeSettings = {
    backupFileExtension = "old";
    useUserPackages = true;
    useGlobalPkgs = true;
    verbose = true;
  };
in
  delib.module {
    name = "system.home";

    home.always = {
      programs.home-manager.enable = true;

      xdg = {
        enable = true;
        autostart.enable = true;
      };

      targets.genericLinux.enable = !(pkgs.stdenv.isDarwin || builtins.pathExists "/etc/NIXOS");
    };

    nixos.always.home-manager = homeSettings;

    darwin.always.home-manager = homeSettings;
  }
