{
  config,
  pkgs,
  lib,
  namespace,
  ...
}:
with lib; {
  config = mkIf config.${namespace}.darwinConfig.enable {
    power = {
      #restartAfterFreeze = true;
      #restartAfterPowerFailure = true;
      sleep = {
        allowSleepByPowerButton = false;
        computer = 60;
        display = 30;
        harddisk = 60;
      };
    };
    environment.systemPackages = [pkgs.coconutbattery];
  };
}
