{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.coding.tools.podman;
in {
  options.${namespace}.coding.tools.podman = with types; {
    enable = mkBoolOpt false "Enable podman, an program for managing pods, containers and container images.";
  };

  config = mkIf cfg.enable {
    #services.podman.enable = true;
    home.packages = with pkgs; [podman podman-compose];
    home.file = {
      ".config/containers/registries.conf".source = ./registries.conf;
      ".config/containers/policy.json".source = ./policy.json;
    };
    programs.zed-editor.extensions = ["dockerfile"];
  };
}
