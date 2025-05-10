{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.ffmpgeg";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = [pkgs.ffmpeg-full];
}
