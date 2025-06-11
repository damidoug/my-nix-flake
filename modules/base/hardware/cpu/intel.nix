{delib, ...}:
delib.module {
  name = "hardware.cpu.intel";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {
    hardware = {
      cpu.intel.updateMicrocode = true;
      enableAllHardware = true;
    };
    boot = {
      kernelModules = ["kvm-intel"];
      kernelParams = ["i915.fastboot=1" "enable_gvt=1"];
    };
  };
}
