{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "gui.affine";

  options = delib.singleEnableOption false;

  home.ifEnabled.home.packages = [pkgs.affine];
}
