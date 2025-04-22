{pkgs, ...}: {
  config = {
    programs.home-manager.enable = true;

    home.stateVersion = "24.11";

    xdg.enable = true;

    targets.genericLinux.enable = !pkgs.stdenv.isDarwin && !builtins.pathExists "/etc/NIXOS";
  };
}
