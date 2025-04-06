{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.coding.lang.dart;
in {
  options.${namespace}.coding.lang.dart = with types; {
    enable = mkBoolOpt false "Enable dart";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      dart
      flutter
    ];
    programs.zed-editor.extensions = ["dart"];
  };
}
