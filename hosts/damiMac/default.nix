{delib, ...}:
delib.host {
  name = "damiMac";
  rice = "workstation";
  type = "desktop";

  home.home.stateVersion = "25.05";
  homeManagerSystem = "aarch64-darwin";

  myconfig.system.user = {
    username = "dami";
    fullname = "Douglas Damiano";
  };

  darwin = {
    nixpkgs.hostPlatform = "aarch64-darwin";
    system.stateVersion = 6;
  };
}
