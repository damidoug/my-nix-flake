{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.developer.podman;
in {
  options.${namespace}.developer.podman = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [podman podman-compose];
      file = {
        ".config/containers/registries.conf".source = ./registries.conf;
        ".config/containers/policy.json".source = ./policy.json;
      };
    };
    programs.zed-editor.extensions = ["dockerfile" "docker-compose"];
  };
}
