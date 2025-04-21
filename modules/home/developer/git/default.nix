{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.developer.git;
in {
  options.${namespace}.developer.git = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    programs.git = {
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
  };
}
