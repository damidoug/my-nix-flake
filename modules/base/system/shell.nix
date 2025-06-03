{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "system.shell";

  options.system.shell = with delib; {
    bash = boolOption true;
    zsh = boolOption pkgs.stdenv.isDarwin;
    fish = boolOption false;
  };

  darwin.always = {cfg, ...}: {
    programs = {
      bash = {
        enable = cfg.bash;
        completion.enable = true;
      };
      zsh = {
        enable = cfg.zsh;
        enableSyntaxHighlighting = true;
      };
      fish = {
        enable = cfg.fish;
        useBabelfish = true;
      };
    };
  };

  home.always = {cfg, ...}: {
    programs = {
      bash.enable = cfg.bash;
      zsh = {
        enable = cfg.zsh;
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
      };
      fish.enable = cfg.fish;
    };
  };

  nixos.always = {cfg, ...}: {
    programs = {
      bash.enable = cfg.bash;
      zsh = {
        enable = cfg.zsh;
        enableBashCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
      };
      fish = {
        enable = cfg.fish;
        useBabelfish = true;
      };
    };
  };
}
