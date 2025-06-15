{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.golang";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    home = {
      packages = with pkgs; [
        go
        gopls
        gofumpt
        golangci-lint
        air
      ];
      sessionVariables.GOPATH = "/$HOME/Developer/.go";
    };
    programs.zed-editor = {
      extensions = ["golangci-lint"];
      userSettings = {
        languages.Go.language_servers = [
          "gopls"
          "golangci-lint"
        ];
        lsp = {
          gopls = {
            gofumpt = true;
            initialization_options.gofumpt = true;
          };
          golangci-lint.initialization_options.command = [
            "golangci-lint"
            "run"
            "--output.json.path"
            "stdout"
            "--show-stats=false"
            "--issues-exit-code=1"
          ];
        };
      };
    };
  };
}
