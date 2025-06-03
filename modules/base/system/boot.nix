{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "system.boot";

  options.system.boot = with delib; {
    grub.enable = boolOption false;
    grub.osprober = boolOption false;
    mountPoint = strOption "/boot";
  };

  nixos.always = {cfg, ...}: {
    environment.systemPackages = with pkgs; [
      efibootmgr
      efitool
      efivar
    ];

    boot = {
      loader = {
        systemd-boot = {
          enable = !cfg.grub.enable;
          configurationLimit = 20;
          editor = false;
        };
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = cfg.mountPoint;
        };
        grub = {
          enable = cfg.grub.enable;
          efiSupport = true;
          devices = ["nodev"];
          useOSProber = cfg.grub.osprober;
          configurationLimit = 20;
        };
        generationsDir.copyKernels = true;
      };

      tmp = {
        useTmpfs = true;
        cleanOnBoot = true;
        tmpfsSize = "50%";
      };
    };

    services.fwupd.enable = true;
  };
}
