{delib, ...}:
delib.host {
  name = "damiMac";
  rice = "workstation";
  type = "desktop";

  home.home.stateVersion = "25.05";
  homeManagerSystem = "aarch64-darwin";

  darwin = {myconfig, ...}: {
    nixpkgs.hostPlatform = "aarch64-darwin";
    system.stateVersion = 6;

    users.users.${myconfig.constants.username} = {
      name = myconfig.constants.username;
      description = myconfig.constants.userfullname;
    };
  };
}
