{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.apps;
in {
  options.${namespace}.apps = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    ${namespace}.apps = {
      affine = enabled;
      brave = enabled;
      spotube = enabled;
      vesktop = enabled;
    };
  };
}
