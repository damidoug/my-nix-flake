{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.coding.tools.zed;
in {
  options.${namespace}.coding.tools.zed = with types; {
    enable = mkBoolOpt false "Enable zed, an high-performance, multiplayer code editor from the creators of Atom and Tree-sitter.";
  };

  config = mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "html"
        "git-firefly"
        "env"
        "log"
        "php"
      ];
      userSettings = {
        features.copilot = false;
        telemetry.diagnostics = false;
        telemetry.metrics = false;
      };
    };
  };
}
