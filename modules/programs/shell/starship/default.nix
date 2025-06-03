{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "shell.starship";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs.starship = {
      enable = true;
      settings = builtins.fromTOML (builtins.readFile ./config.toml);
    };
    home.packages = [pkgs.nerd-fonts.fira-code];
  };
}
