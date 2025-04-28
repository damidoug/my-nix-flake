{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.developer;
in {
  options.${namespace}.developer = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    ${namespace}.developer = {
      bun = enabled;
      ffmpeg = enabled;
      git = enabled;
      go = enabled;
      nix = enabled;
      pocketbase = enabled;
      podman = enabled;
      python = enabled;
      rust = enabled;
      zed = enabled;
    };
    home.file."Developer/.keep".text = "";
  };
}
