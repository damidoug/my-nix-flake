{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.shell;
in {
  options.${namespace}.shell = with types; {
    enable = mkBoolOpt true "Enable shell module";
  };

  config = mkIf cfg.enable {
    # Configurations for specific programs like 'aria2', 'fd', 'fzf', etc.
    programs = {
      # Enable aria2 (downloading utility)
      aria2.enable = true;
      # Enable 'bat' (for better file viewing)
      bat = {
        enable = true;
        # Define extra packages for 'bat' program (used for improved `cat`, `diff`, `grep`, etc.)
        extraPackages = with pkgs.bat-extras; [
          batgrep
          batman
          batpipe
          batwatch
          batdiff
          prettybat
        ];
      };

      # Enable 'eza' (modern ls replacement)
      eza = {
        enable = true;
        git = true;
        icons = "auto";
        colors = "auto";
        extraOptions = [
          "--group-directories-first"
          "--header"
        ];
      };

      # Enable 'fd' (fuzzy file finder)
      fd = {
        enable = true;
        extraOptions = ["--absolute-path"];
      };

      # Enable 'fzf' (fuzzy search utility)
      fzf = {
        enable = true;
        defaultCommand = "fd --type f --color=always";
        fileWidgetCommand = "fd --type f --color=always";
      };

      # Enable 'fastfetch' (system information display)
      fastfetch.enable = true;

      # Enable 'micro' (terminal-based text editor)
      micro.enable = true;

      kitty.enable = true;

      # Enable 'starship' (shell prompt)
      starship = {
        enable = true;
        enableTransience = config.programs.fish.enable;
        settings = builtins.fromTOML (builtins.readFile ./starship.toml);
      };

      # Enable 'zoxide' (fuzzy cd navigation)
      zoxide.enable = true;
    };
    home = {
      # Define packages to install on the user's home directory
      packages = with pkgs; [
        doggo # A fun DNS lookup utility that acts like 'dig' but in a friendly way
        xsel # A simple clipboard utility for managing X11 selections
        speedtest-go # Command-line interface for running speed tests
        just # A modern make alternative for task automation
        gping # Graphical ping utility for visualizing ping results
        rsync # Reliable file copy tool with synchronization support
        nerd-fonts.fira-code # Fira Code font with programming ligatures
        ffmpeg-full # Complete, cross-platform solution to record, convert and stream audio and video
      ];
      # Define shortcuts for commonly used commands
      shellAliases = {
        dig = "doggo"; # Replaces 'dig' with 'doggo' for DNS lookup
        speed = "speedtest-go"; # Replaces 'speed' with 'speedtest-go' for speed testing
        make = "just"; # Replaces 'make' with 'just' for simplified task running
        nano = "micro"; # Replaces 'nano' with 'micro' for better cli text editor
        ping = "gping"; # Replaces 'ping' with 'gping' for a graphical ping
        la = "eza -a"; # 'la' is replaced with 'eza -a' for a more informative listing
        ll = "eza -l"; # 'll' is replaced with 'eza -l' for a long listing
        lla = "eza -la"; # 'lla' is replaced with 'eza -la' for a detailed listing
        ls = "eza"; # Use 'eza' instead of 'ls' for listing files with extra features
        cat = "bat"; # Replaces 'cat' with 'bat' for better file viewing
        diff = "batdiff"; # Replaces 'diff' with 'batdiff' for enhanced diff view
        grep = "batgrep"; # Replaces 'grep' with 'batgrep' for improved grep functionality
        man = "batman"; # Replaces 'man' with 'batman' for man pages with syntax highlighting
        pipe = "batpipe"; # Replaces 'pipe' with 'batpipe' for piping content through 'bat'
        pretty = "prettybat"; # Replaces 'pretty' with 'prettybat' for pretty printed files
        watch = "batwatch"; # Replaces 'watch' with 'batwatch' for watching files with 'bat'
        find = "fd"; # Replaces 'find' with 'fd' for a more modern and faster search
        cd = "z"; # Replaces 'cd' with 'z' for faster directory navigation
        mypc = "fastfetch"; # Replaces 'mypc' with 'fastfetch' for displaying system info
        cp = "rsync -a --progress"; # Use 'rsync' instead of 'cp' for safer and progress-aware copying
        trash = "rsync -a --progress --remove-source-files --backup-dir=~/.trash"; # Use rsync to move files to trash
      };
      # Apply session variables
      sessionVariables = {
        EDITOR = "micro"; # Default editor
        TERMINAL = "rio"; # Default terminal emulator
      };
    };
  };
}
