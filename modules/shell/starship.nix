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
      settings = {
        "$schema" = "https://starship.rs/config-schema.json";
        # Inserts a blank line between shell prompts
        add_newline = true;
      };
    };
    home.packages = [
      pkgs.nerd-fonts.fira-code
    ];
  };
}
