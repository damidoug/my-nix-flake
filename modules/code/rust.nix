{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "code.rust";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    home.packages = [pkgs.rustup];
    programs.zed-editor.extensions = ["toml"];
  };
}
