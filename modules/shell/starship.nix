{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "shell.starship";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs.starship.enable = true;
    home.packages = [
      pkgs.nerd-fonts.fira-code
    ];
  };
}
