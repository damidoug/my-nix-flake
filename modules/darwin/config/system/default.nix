{
  config,
  lib,
  namespace,
  ...
}:
with lib; {
  config.system.defaults = mkIf config.${namespace}.darwinConfig.enable {
    ".GlobalPreferences" = {
      "com.apple.mouse.scaling" = -1.0;
      "com.apple.sound.beep.sound" = "/System/Library/Sounds/Blow.aiff";
    };
    ActivityMonitor = {
      IconType = 0;
      OpenMainWindow = true;
      ShowCategory = 100;
      SortColumn = "CPUUsage";
      SortDirection = 0;
    };
    NSGlobalDomain = {
      AppleICUForce24HourTime = false;
      AppleInterfaceStyle = "Dark";
      AppleInterfaceStyleSwitchesAutomatically = false;
      AppleMeasurementUnits = "Centimeters";
      AppleTemperatureUnit = "Celsius";
      AppleMetricUnits = 1;
      AppleShowAllExtensions = true;
      AppleShowScrollBars = "Automatic";
      NSDocumentSaveNewDocumentsToCloud = false;
      NSWindowResizeTime = 0.2;
      NSWindowShouldDragOnGesture = true;
      _HIHideMenuBar = false; # if use SketchyBar enable it
      "com.apple.sound.beep.feedback" = 1;
      "com.apple.sound.beep.volume" = 0.4723665;
    };
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
    trackpad = {
      # silent clicking = 0, default = 1
      ActuationStrength = 0;
      # enable tap to click
      Clicking = true;
      # Enable tap to drag
      Dragging = false;
      # firmness level, 0 = lightest, 2 = heaviest
      FirstClickThreshold = 1;
      # firmness level for force touch
      SecondClickThreshold = 1;
      # don't allow positional right click
      TrackpadRightClick = true;
      # three finger drag
      TrackpadThreeFingerDrag = true;
      # 0 to disable three finger tap, 2 to trigger Look up & data detectors.
      TrackpadThreeFingerTapGesture = 2;
    };
  };
}
