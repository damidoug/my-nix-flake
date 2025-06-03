{
  delib,
  config,
  ...
}:
delib.module {
  name = "system.locale";

  options.system.locale = with delib; {
    timeZone = strOption "America/New_York";
    locale = strOption "en_US.UTF-8";
    supportedLocales = listOption strOption ["en_US.UTF-8"];
    keyMap = strOption "us";
  };

  darwin.always = {cfg, ...}: {
    time.timeZone = cfg.timeZone;
  };

  nixos.always = {cfg, ...}: {
    console = {
      keyMap = cfg.keyMap;
      useXkbConfig = config.services.xserver.enable;
    };

    services.xserver.xkb.layout = cfg.keymap;

    time = {
      timeZone = cfg.timeZone;
      hardwareClockInLocalTime = true;
    };

    i18n = {
      defaultLocale = cfg.locale;
      supportedLocales = cfg.supportedLocales;
      extraLocaleSettings.LC_ALL = cfg.locale;
    };
  };
}
