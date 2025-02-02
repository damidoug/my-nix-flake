{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.coding.lang.python;
in {
  options.${namespace}.coding.lang.python = with types; {
    enable = mkBoolOpt false "Enable python, an high-level dynamically-typed programming language.";
  };

  config = mkIf cfg.enable {
    home.packages = [
      (pkgs.python312.withPackages (
        python-pkgs:
          with python-pkgs; [
            uv
            ruff
            httpie
          ]
      ))
    ];
    programs.zed-editor = {
      extensions = ["ruff"];
      userSettings = {
        languages.Python = {
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
  };
}
