{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.nix";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    home.packages = with pkgs; [
      alejandra
      nil
    ];
    programs.zed-editor = {
      extensions = ["nix"];
      userSettings.languages.Nix = {
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
