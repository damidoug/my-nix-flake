{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.coding.lang.nix;
in {
  options.${namespace}.coding.lang.nix = with types; {
    enable = mkBoolOpt false "Enable rust, an safe, concurrent, practical language.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      nixfmt-rfc-style # Official formatter for Nix code
      nil # Yet another language server for Nix
      nix-prefetch # Prefetch any fetcher function call, e.g. package sources
      nix-prefetch-git # Script used to obtain source hashes for fetchgit
      nixpkgs-review
    ];
  };
}
