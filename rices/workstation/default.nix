{delib, ...}:
delib.rice {
  name = "workstation";

  myconfig = {
    gui = {
      affine.enable = true;
      bitwarden.enable = true;
      brave.enable = true;
      ghostty.enable = true;
      mpv.enable = true;
      usebruno.enable = true;
      vesktop.enable = true;
      zed.enable = true;
    };
    cli = {
      starship.enable = true;
      bun.enable = true;
      ffmpeg.enable = true;
      golang.enable = true;
      jujutsu.enable = true;
      podman.enable = true;
      python.enable = true;
      rust.enable = true;
      usebruno.enable = true;
      zig.enable = true;
    };
  };
}
