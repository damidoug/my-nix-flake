{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:
with lib; {
  config.nix = mkIf config.${namespace}.darwinConfig.enable {
    package = mkForce pkgs.lix;
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
    settings = {
      allowed-users = mkDefault ["*"];
      experimental-features = mkDefault [
        "nix-command"
        "flakes "
      ];
      trusted-users = mkDefault [
        "root"
        "@wheel"
        "@admin"
      ];
      sandbox = true;
      use-xdg-base-directories = true;
    };
  };
}
