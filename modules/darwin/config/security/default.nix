{
  config,
  namespace,
  lib,
  ...
}:
with lib; {
  config = mkIf config.${namespace}.darwinConfig.enable {
    security = {
      pam.services.sudo_local = {
        enable = true;
        reattach = true;
        touchIdAuth = true;
        watchIdAuth = false;
      };
      # Set sudo timeout to 5 minutes
      sudo.extraConfig = "Defaults    timestamp_timeout=5";
    };
    system.defaults.alf = {
      # Allows any downloaded Application that has been signed to accept incoming requests.
      allowdownloadsignedenabled = 1;
      # Allows any signed Application to accept incoming requests
      allowsignedenabled = 1;
      # Enable the internal firewall to prevent unauthorised applications, programs and services from accepting incoming connections.
      globalstate = 1;
      # Enable logging of requests made to the firewall.
      loggingenabled = 0;
      # Drops incoming requests via ICMP such as ping requests.
      stealthenabled = 1;
    };
  };
}
