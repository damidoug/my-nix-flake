{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "hardware.bluetooth";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings.General = {
        Experimental = true;
        JustWorksRepairing = "always";
        KernelExperimental = true;
        MultiProfile = "multiple";
      };
    };

    systemd.user.services.mpris-proxy = {
      description = "Mpris proxy";
      after = ["network.target" "sound.target"];
      wantedBy = ["default.target"];
      serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };
  };
}
