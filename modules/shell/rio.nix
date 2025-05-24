{delib, ...}:
delib.module {
  name = "shell.rio";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs.rio.enable = true;
    home.sessionVariables.TERMINAL = "rio";
  };
}
