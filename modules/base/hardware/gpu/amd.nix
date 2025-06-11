{
  delib,
  pkgs,
  lib,
  ...
}:
delib.module {
  name = "hardware.gpu.amd";

  options.hardware.gpu.amd = with delib; {
    enable = boolOption false;
    legacySupport = boolOption false;
  };

  nixos.ifEnabled = {cfg, ...}:
    with lib; {
      hardware = {
        amdgpu = {
          initrd.enable = true;
          opencl.enable = true;
          amdvlk = {
            enable = true;
            support32Bit.enable = true;
            supportExperimental.enable = true;
          };
          legacySupport.enable = cfg.legacySupport;
        };
        graphics.extraPackages = with pkgs; [
          vulkan-tools
          vulkan-loader
          vulkan-validation-layers
          vulkan-extension-layer
        ];
      };

      environment = {
        variables = {
          VDPAU_DRIVER = "radeonsi";
          LIBVA_DRIVER_NAME = "radeonsi";
          ROC_ENABLE_PRE_VEGA = mkIf cfg.legacySupport "1";
        };
        systemPackages = [pkgs.lact];
      };

      systemd = {
        packages = [pkgs.lact];
        services.lactd.wantedBy = ["multi-user.target"];
        tmpfiles.rules = let
          rocmEnv = pkgs.symlinkJoin {
            name = "rocm-combined";
            paths = with pkgs.rocmPackages; [
              rocblas
              hipblas
              clr
            ];
          };
        in [
          "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
        ];
      };
    };
}
