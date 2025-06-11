{
  delib,
  config,
  ...
}:
delib.module {
  name = "system.locale";

  options.system.locale = with delib; {
    timeZone = strOption "America/New_York";
    language = strOption "en_US.UTF-8";
    supportedLanguages = listOption strOption ["en_US.UTF-8"];
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

    services.xserver.xkb.layout = cfg.keyMap;

    time = {
      timeZone = cfg.timeZone;
      hardwareClockInLocalTime = true;
    };

    i18n = {
      defaultLocale = cfg.language;
      supportedLocales = cfg.supportedLanguages;
      extraLocaleSettings.LC_ALL = cfg.language;
    };
  };
}
