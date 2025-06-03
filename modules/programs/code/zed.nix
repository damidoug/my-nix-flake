{delib, ...}:
delib.module {
  name = "code.zed";

  options = delib.singleEnableOption false;

  home.ifEnabled.programs.zed-editor = {
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
}
