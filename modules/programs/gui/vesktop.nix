{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "gui.vesktop";

  options = delib.singleEnableOption false;

  home.ifEnabled = {
    home.packages = [pkgs.vesktop];
    programs.zed-editor = {
      extensions = ["discord-presence"];
      userSettings.lsp.discord_presence.initialization_options = {
        state = "Developing in {language:u}";
        details = "In a workspace";
        git_integration = true;
        idle = {
          timeout = 300; # 5 minutes
          action = "clear_activity";
        };
      };
    };
  };
}
