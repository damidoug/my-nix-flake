{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.usebruno";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = [pkgs.bruno-cli];
}
