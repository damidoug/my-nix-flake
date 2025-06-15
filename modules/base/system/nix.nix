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

  packages = with pkgs; [
    alejandra
    nixfmt-rfc-style
    nix-prefetch-scripts
    nixfmt-tree
    nil
  ];
in
  delib.module {
    name = "system.nix";

    darwin.always = {
      documentation.enable = false;
      nix = nixConfig // {optimise.automatic = true;};
      environment.systemPackages = packages;
    };

    nixos.always = {
      documentation.nixos.enable = false;
      nix = nixConfig // {optimise.automatic = true;};
      environment.systemPackages = packages;
    };

    home.always = {
      nix = nixConfig;
      home.packages = packages;
    };
  }
