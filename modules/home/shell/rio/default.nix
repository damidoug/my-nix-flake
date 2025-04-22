{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.shell.rio;
in {
  options.${namespace}.shell.rio = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    programs.rio.enable = true;
    home.sessionVariables.TERMINAL = "rio";
  };
}
