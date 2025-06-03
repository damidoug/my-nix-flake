{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "system.user";

  options.system.user = with delib; {
    username = strOption "";
    fullname = strOption "";
    email = strOption "";
    initialPassword = strOption "password";
    extraGroups = listOfOption strOption ["wheel"];
  };

  darwin.always = {cfg, ...}: {
    assertions = [
      {
        assertion = cfg.username != "" && cfg.fullname != "";
        message = "system.user.username and system.user.fullname cannot be empty";
      }
    ];
    users.users.${cfg.username} = {
      name = cfg.username;
      description = cfg.fullname; # Fixed typo: was cfg.userfullname
      # shell = "";
      # home
      # createHome
      # isHidden
    };
  };

  nixos.always = {cfg, ...}: {
    assertions = [
      {
        assertion = cfg.username != "" && cfg.fullname != "";
        message = "system.user.username and system.user.fullname cannot be empty";
      }
    ];
    users.users.${cfg.username} = {
      name = cfg.username;
      description = cfg.fullname; # Fixed typo: was cfg.userfullname
      isNormalUser = true;
      initialPassword = cfg.initialPassword;
      extraGroups = cfg.extraGroups;
      # shell = "";
    };
  };

  home.always = {cfg, ...}: {
    assertions = [
      {
        assertion = cfg.username != "" && cfg.fullname != "";
        message = "system.user.username and system.user.fullname cannot be empty";
      }
    ];
    home = {
      username = cfg.username;
      homeDirectory =
        if pkgs.stdenv.isDarwin
        then "/Users/${cfg.username}"
        else "/home/${cfg.username}";
    };
  };
}
