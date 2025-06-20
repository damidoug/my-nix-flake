{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.python";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    home.packages = [
      (pkgs.python313.withPackages (python-pkgs:
        with python-pkgs; [
          uv
          ruff
        ]))
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
