{delib, ...}:
delib.module {
  name = "hardware.battery";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {myconfig, ...}: {
    powerManagement = {
      enable = true;
      powertop.enable = true;
    };
    services = {
      auto-cpufreq = {
        enable = true;
        settings = {
          battery = {
            governor = "powersave";
            turbo = "never";
          };
          charger = {
            governor = "performance";
            turbo = "auto";
          };
        };
      };
      #thermald.enable = myconfig.hardware.cpu.intel;
      logind = {
        lidSwitch = "poweroff";
        lidSwitchExternalPower = "lock";
        lidSwitchDocked = "ignore";
      };
    };
  };
}
