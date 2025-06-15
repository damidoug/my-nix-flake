{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.ffmpeg";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = [pkgs.ffmpeg-full];
}
