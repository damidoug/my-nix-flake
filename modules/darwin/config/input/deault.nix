{
  lib,
  namespace,
  config,
  pkgs,
  ...
}:
with lib; {
  config = mkIf config.${namespace}.darwinConfig.enable {
    time.timeZone = config.${namespace}.darwinConfig.timeZone;
    fonts.packages = [
      pkgs.nerd-fonts.fira-code
    ];
  };
}
