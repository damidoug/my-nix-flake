{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "code.usebruno";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = with pkgs; [bruno bruno-cli];
}
