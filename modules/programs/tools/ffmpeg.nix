{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "tools.ffmpgeg";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = [pkgs.ffmpeg-full];
}
