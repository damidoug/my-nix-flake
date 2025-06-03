{
  delib,
  lib,
  ...
}:
delib.module {
  name = "system.networking";

  options.system.networking = with delib; {
    dns = listOption strOption [
      "94.140.14.15"
      "94.140.15.16"
      "2a10:50c0::bad1:ff"
      "2a10:50c0::bad2:ff"
    ];
  };

  darwin.always = {cfg, ...}:
    with lib; {
      networking = {
        dns = mkDefault cfg.dns;
        knownNetworkServices = [
          "Wi-Fi"
          "Thunderbolt Bridge"
        ];
        # localHostName = "";
        # computerName = "";
        # hostName = "";
      };
    };

  nixos.always = {myconfig, ...}:
    with lib; let
      inherit (myconfig.system.user.username) username;
    in {
      networking = {
        # hostName = "";
        networkmanager = {
          enable = true;
          dns = "none";
          ethernet.macAddress = "random";
          wifi = {
            backend = "iwd";
            macAddress = "random";
          };
        };
        nameservers = mkDefault cfg.dns;
        useDHCP = mkDefault false;
        dhcpcd.enable = mkDefault false;
      };
      users.users.${username}.extraGroups = ["networkmanager" "network"];
    };
}
