{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "cli.rust";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    home.packages = with pkgs; [
      cargo
      clippy
      rust-analyzer
      rustc
      rustfmt
    ];
    programs.zed-editor.extensions = ["toml"];
  };
}
