{delib, ...}:
delib.module {
  name = "shell.bash";

  options = delib.singleEnableOption false;

  home.ifEnabled.programs.bash.enable = true;
}
