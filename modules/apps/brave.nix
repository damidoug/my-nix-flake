{delib, ...}:
delib.module {
  name = "apps.brave";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs.brave.enable = true;
    home.sessionVariables.BROWSER = "brave";
  };
}
