{delib, ...}:
delib.module {
  name = "code.git";

  options = delib.singleEnableOption false;

  home.ifEnabled.programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "damidoug";
    userEmail = "contact@damidoug.dev";
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
  };
}
