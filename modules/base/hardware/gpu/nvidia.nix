{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "hardware.gpu.nvidia";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {
    services.xserver.videoDrivers = ["nvidia"];
    hardware = {
      nvidia = {
        modesetting.enable = true;
        nvidiaSettings = true;
        powerManagement = {
          enable = true;
          finegrained = false;
        };
      };
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          vulkan-tools
          vulkan-loader
          vulkan-validation-layers
          vulkan-extension-layer
        ];
      };
    };
  };
}
