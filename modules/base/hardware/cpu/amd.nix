{
  delib,
  config,
  pkgs,
  ...
}:
delib.module {
  name = "hardware.cpu.amd";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {
    hardware = {
      cpu.amd.updateMicrocode = true;
      enableAllHardware = true;
    };
    boot = {
      kernelModules = [
        "kvm-amd"
        "amd-pstate"
        "zenpower"
        "msr"
      ];
      kernelParams = ["amd_pstate=active"];
      extraModulePackages = [config.boot.kernelPackages.zenpower];
    };
    environment.systemPackages = [pkgs.amdctl];
  };
}
