{namespace, ...}: let
  pcName = "damiMac";
in {
  ${namespace}.darwinConfig = {
    enable = true;

    computerName = pcName;
    hostName = pcName;
    localHostName = pcName;
    timeZone = "Europe/Malta";
  };
  system.stateVersion = 6;
}
