{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "code.zig";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = [pkgs.zig];
}
