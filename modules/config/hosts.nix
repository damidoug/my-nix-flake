{
  delib,
  lib,
  ...
}:
delib.module {
  name = "hosts";
  options = with delib; let
    host = {config, ...}: {
      options =
        hostSubmoduleOptions
        // {
          type = noDefault (enumOption ["desktop" "server"] null);
          isDesktop = boolOption (config.type == "desktop");
          isServer = boolOption (config.type == "server");
        };
    };
  in {
    host = hostOption host;
    hosts = hostsOption host;
  };
  home.always = {myconfig, ...}: let
    isAnyGuiAppEnabled = lib.any (app: app.enable or false) (lib.attrValues myconfig.gui);
  in {
    assertions =
      (delib.hostNamesAssertions myconfig.hosts)
      ++ [
        {
          assertion = !isAnyGuiAppEnabled || myconfig.host.isDesktop;
          message = "GUI applications can only be enabled on a 'desktop' host.";
        }
      ];
  };
}
