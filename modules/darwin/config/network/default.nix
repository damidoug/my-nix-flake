{
  config,
  namespace,
  lib,
  ...
}:
with lib; {
  config.networking = mkIf config.${namespace}.darwinConfig.enable {
    computerName = mkDefault config.${namespace}.darwinConfig.computerName;
    hostName = mkDefault config.${namespace}.darwinConfig.hostName;
    localHostName = mkDefault config.${namespace}.darwinConfig.localHostName;
    dns = mkDefault [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };
}
