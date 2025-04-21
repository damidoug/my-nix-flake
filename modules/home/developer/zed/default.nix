{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.developer.zed;
in {
  options.${namespace}.developer.zed = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "html"
        "scss"
        "graphql"
        "make"
        "git-firefly"
        "env"
        "log"
        "php"
        "sql"
        "xml"
        "one-dark-pro"
      ];
      userSettings = {
        features.copilot = false;
        telemetry.diagnostics = false;
        telemetry.metrics = false;
        theme = {
          mode = "system";
          light = "One Light";
          dark = "One Dark Pro";
        };
      };
    };
  };
}
