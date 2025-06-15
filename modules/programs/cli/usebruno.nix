{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.usebruno";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = with pkgs; [bruno bruno-cli];
}
