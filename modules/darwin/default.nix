{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.darwinConfig;
in {
  options.${namespace}.darwinConfig = with types; {
    enable = mkEnableOption "Enable darwin configuration";
    computerName = mkStrOpt "" "Computer name for the system";
    hostName = mkStrOpt "" "Host name of the system";
    localHostName = mkStrOpt "" "Local host name used in Bonjour";
    timeZone = mkStrOpt "" "Time zone setting (e.g., 'America/Los_Angeles')";
  };

  config = mkIf cfg.enable {
    assertions = [
      {
        assertion = all (s: s != "") [
          cfg.computerName
          cfg.hostName
          cfg.localHostName
          cfg.timeZone
        ];
        message = "${namespace}.darwinConfig: All fields (computerName, hostName, localHostName, timeZone) must be set and non-empty when enabled.";
      }
    ];
  };
}
