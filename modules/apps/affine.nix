{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "apps.affine";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    home.packages = [pkgs.affine];
  };
}
