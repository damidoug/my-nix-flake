{delib, ...}:
delib.module {
  name = "gui.rio";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs.rio.enable = true;
    home.sessionVariables.TERMINAL = "rio";
  };
}
