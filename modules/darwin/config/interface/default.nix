{
  config,
  lib,
  namespace,
  ...
}:
with lib; {
  config.system.defaults = mkIf config.${namespace}.darwinConfig.enable {
    controlcenter = {
      AirDrop = false;
      BatteryShowPercentage = false;
      Bluetooth = false;
      Display = false;
      FocusModes = false;
      NowPlaying = false;
      Sound = false;
    };
    dock = {
      enable-spring-load-actions-on-all-items = true;
      appswitcher-all-displays = true;
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 1.0;
      # dashboard-in-overlay
      # expose-animation-duration
      # expose-group-apps
      largesize = 16;
      magnification = true;
      mineffect = "scale";
      minimize-to-application = true;
      mouse-over-hilite-stack = true;
      mru-spaces = false;
      orientation = "bottom";
      # persistent-apps = [
      # ];
      scroll-to-open = true; # Scroll up on a Dock icon to show all Space’s opened windows for an app, or open stack.
      show-process-indicators = true;
      show-recents = false;
      showhidden = false;
      static-only = false;
      tilesize = 50;
      # Hot corners
      # Possible values:
      #  0: no-op
      #  2: Mission Control
      #  3: Show application windows
      #  4: Desktop
      #  5: Start screen saver
      #  6: Disable screen saver
      #  7: Dashboard
      # 10: Put display to sleep
      # 11: Launchpad
      # 12: Notification Center
      # 13: Lock Screen
      # 14: Quick Notes
      wvous-tl-corner = 2;
      wvous-tr-corner = 12;
      wvous-bl-corner = 14;
      wvous-br-corner = 4;
    };
    finder = {
      AppleShowAllFiles = false;
      FXEnableExtensionChangeWarning = true;
      FXPreferredViewStyle = "Nlsv";
      FXRemoveOldTrashItems = true;
      NewWindowTarget = "Home";
      QuitMenuItem = false;
      ShowExternalHardDrivesOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowMountedServersOnDesktop = false;
      ShowRemovableMediaOnDesktop = false;
      ShowPathbar = true;
      ShowStatusBar = true;
      _FXShowPosixPathInTitle = false;
    };
    loginwindow = {
      GuestEnabled = false;
      SHOWFULLNAME = false;
      autoLoginUser = "Off";
    };
    menuExtraClock = {
      IsAnalog = false;
      ShowAMPM = true;
      ShowDate = 1;
      ShowDayOfWeek = true;
      ShowSeconds = true;
    };
    screencapture = {
      disable-shadow = false;
      target = "file";
      #location = "$HOME/Pictures/screenshots/";
      type = "png";
    };
  };
}
