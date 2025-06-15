{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "gui.ghostty";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs.ghostty = {
      enable = true;
      package =
        if pkgs.stdenv.isDarwin
        then pkgs.ghostty-bin
        else pkgs.ghostty;
    };
    home.sessionVariables.TERMINAL = "ghostty";
  };
}
