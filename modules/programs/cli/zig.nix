{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.zig";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = with pkgs; [
    zig
    zls
  ];
}
