{
  config,
  namespace,
  lib,
  ...
}:
with lib; {
  config.programs.zsh = mkIf config.${namespace}.darwinConfig.enable {
    enable = true;
    enableSyntaxHighlighting = true;
    enableCompletion = true;
  };
}
