{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.golang";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs.go = {
      enable = true;
      goPath = "Developer/.go";
    };
    home.packages = with pkgs; [
      air
      gopls
    ];
  };
}
