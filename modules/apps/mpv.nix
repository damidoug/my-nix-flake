{
  delib,
  pkgs,
  lib,
  ...
}:
delib.module {
  name = "apps.mpv";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs.mpv = {
      enable = !pkgs.stdenv.isDarwin;
      scripts = with pkgs.mpvScripts; [
        webtorrent-mpv-hook
        thumbfast
      ];
    };
    home.packages = lib.mkIf pkgs.stdenv.isDarwin [pkgs.iina];
  };
}
