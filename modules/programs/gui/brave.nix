{delib, ...}:
delib.module {
  name = "gui.brave";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    programs.brave = {
      enable = true;
      commandLineArgs = [
        "--ignore-gpu-blocklist"
        "--disable-breakpad"
        "--no-pings"
      ];
    };
    home.sessionVariables.BROWSER = "brave";
  };
}
