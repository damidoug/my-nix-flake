{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.apps.mpv;
in {
  options.${namespace}.apps.mpv = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    programs.mpv = {
      enable = !pkgs.stdenv.isDarwin;
      scripts = with pkgs.mpvScripts; [
        webtorrent-mpv-hook
        thumbfast
      ];
    };
    home.packages = mkIf pkgs.stdenv.isDarwin [pkgs.iina];
  };
}
