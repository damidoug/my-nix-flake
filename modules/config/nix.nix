{
  delib,
  lib,
  pkgs,
  ...
}:
delib.module {
  name = "nix";

  home.always.nix = with lib; {
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = mkDefault ["nix-command" "flakes"];
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

  # FIX ME (config not change)
  darwin.always.nix = with lib; {
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
    settings = {
      experimental-features = mkDefault ["nix-command" "flakes"];
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
}
