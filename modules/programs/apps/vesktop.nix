{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "apps.vesktop";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    home.packages = [pkgs.vesktop];
    programs.zed-editor.extensions = ["discord-presence"];
  };
}
