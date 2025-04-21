{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.developer.nix;
in {
  options.${namespace}.developer.nix = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      alejandra
      nil
    ];
    programs.zed-editor = {
      extensions = ["nix"];
      userSettings.languages.Nix = {
        language_servers = ["nil" "!nixd"];
        format_on_save = "on";
        formatter.external = {
          command = "alejandra";
          arguments = ["--quiet" "--"];
        };
      };
    };
  };
}
