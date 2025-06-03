{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "apps.bitwarden";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    home.packages = [pkgs.bitwarden-desktop];
    programs.brave.extensions = ["nngceckbapebfimnlniiiahkandclblb"];
  };
}
