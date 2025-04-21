{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.apps.brave;
in {
  options.${namespace}.apps.brave = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    programs.brave.enable = true;
    home.sessionVariables.BROWSER = "brave";
  };
}
