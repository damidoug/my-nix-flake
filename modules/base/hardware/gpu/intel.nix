{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "hardware.gpu.intel";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {
    services.xserver.videoDrivers = ["modesetting"];
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vulkan-tools
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer
        vpl-gpu-rt
      ];
    };
    environment.systemPackages = [pkgs.pkgs.intel-gpu-tools];
  };
}
