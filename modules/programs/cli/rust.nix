{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.rust";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    home.packages = with pkgs; [rustup cargo-tauri];
    programs.zed-editor.extensions = ["toml"];
  };
}
