{delib, ...}:
delib.rice {
  name = "workstation";

  myconfig = {
    apps = {
      affine.enable = true;
      bitwarden.enable = true;
      brave.enable = true;
      mpv.enable = true;
      spotube.enable = false;
      vesktop.enable = true;
    };
    code = {
      bun.enable = true;
      git.enable = true;
      golang.enable = true;
      nix.enable = true;
      podman.enable = true;
      python.enable = true;
      rust.enable = true;
      usebruno.enable = true;
      zed.enable = true;
      zig.enable = true;
    };
    tools.ffmpgeg.enable = true;
    shell = {
      starship.enable = true;
      rio.enable = true;
    };
  };
}
