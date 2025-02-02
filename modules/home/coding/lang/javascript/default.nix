{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.coding.lang.javascript;
in {
  options.${namespace}.coding.lang.javascript = with types; {
    enable = mkBoolOpt false "Enable javascript coding tools.";
  };

  config = mkIf cfg.enable {
    programs = {
      bun = {
        enable = true;
        settings = {
          smol = true;
          telemetry = false;
          test = {
            coverage = true;
            coverageThreshold = 0.9;
          };
        };
      };
      zed-editor.extensions = ["vue"];
    };
  };
}
