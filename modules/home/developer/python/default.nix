{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.developer.python;
in {
  options.${namespace}.developer.python = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      python313
      uv
      ruff
    ];
    programs.zed-editor = {
      extensions = ["ruff"];
      userSettings.languages.Python = {
        language_servers = ["ruff"];
        format_on_save = "on";
        formatter = [
          {
            code_actions = {
              "source.organizeImports.ruff" = true;
              "source.fixAll.ruff" = true;
            };
          }
          {
            language_server.name = "ruff";
          }
        ];
      };
    };
  };
}
