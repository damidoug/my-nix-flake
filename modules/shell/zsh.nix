{delib, ...}:
delib.module {
  name = "shell.zsh";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
    };
  };
}
