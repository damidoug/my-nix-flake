{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "gui.spotube";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = with pkgs; [spotube yt-dlp];
}
