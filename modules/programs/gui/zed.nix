{delib, ...}:
delib.module {
  name = "gui.zed";

  options = delib.singleEnableOption false;

  home.ifEnabled.programs.zed-editor = {
    enable = true;
    extensions = [
      "html"
      "scss"
      "graphql"
      "make"
      "git-firefly"
      "nix"
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
      languages.Nix = {
        language_servers = ["nil" "!nixd"];
        format_on_save = "on";
        formatter.external = {
          command = "alejandra";
          arguments = ["--quiet" "--"];
        };
      };
    };
  };
}
