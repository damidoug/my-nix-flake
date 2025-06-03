{
  delib,
  lib,
  ...
}:
delib.module {
  name = "hardware.audio";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {myconfig, ...}: let
    inherit (myconfig.system.user.username) username;
  in {
    security.rtkit.enable = true;
    services = {
      pulseaudio.enable = lib.mkForce false;
      pipewire = {
        enable = true;
        audio.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
        wireplumber.enable = true;
      };
    };
    users.users.${username}.extraGroups = ["audio"];
  };
}
