{delib, ...}:
delib.module {
  name = "system.fonts";

  home.always.fonts.fontconfig.enable = true;

  nixos.always.fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
  };
}
