{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "gui.usebruno";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = [pkgs.bruno];
}
