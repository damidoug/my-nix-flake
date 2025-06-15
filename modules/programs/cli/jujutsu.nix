{delib, ...}:
delib.module {
  name = "cli.jujutsu";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs.jujutsu = {
      enable = true;
      settings.user = {
        name = "damidoug";
        email = "contact@damidoug.dev";
      };
    };
    home.shellAliases.git = "jj git";
  };
}
