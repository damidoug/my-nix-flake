{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "code.golang";

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
