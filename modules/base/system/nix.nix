{
  delib,
  lib,
  pkgs,
  ...
}: let
  nixConfig = with lib; {
    package = mkForce pkgs.lix;
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-allocate-uids = true;
      experimental-features = mkDefault ["nix-command" "flakes" "auto-allocate-uids"];
      allowed-users = mkDefault ["*"];
      trusted-users = mkDefault [
        "root"
        (
          if pkgs.stdenv.isDarwin
          then "@admin"
          else "@wheel"
        )
      ];
      sandbox = true;
      use-xdg-base-directories = true;
    };
  };
in
  delib.module {
    name = "system.nix";

    darwin.always.nix = nixConfig // {optimise.automatic = true;};

    nixos.always.nix = nixConfig // {optimise.automatic = true;};

    home.always.nix = nixConfig;
  }
