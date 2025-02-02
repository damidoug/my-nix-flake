# My Nix Flake

This is my personal Nix flake configuration, which sets up my development environment using Nix and Home Manager. It includes various applications, development tools, and system configurations. In the future, I plan to extend it to support both NixOS and Darwin (macOS) systems.

## Features

- **Home Manager Configuration**: Defines applications and development tools for my user environment.
- **Development Tools**: Includes Podman, Git, Treefmt, and Zed.
- **Programming Languages**: Configurations for Nix, Python, Golang, Rust, Lua, and JavaScript.
- **Overlays**: Custom overlays, including Bitwarden.
- **Templates**: Reusable templates for modules, overlays, and system configurations.
- **System Support (Upcoming)**: Plans to define full NixOS and Darwin configurations.
- **Using [snowfallorg/lib](https://github.com/snowfallorg/lib)**: Leverages this library to improve module and package management.

## Structure

- `flake.nix` - Main flake definition.
- `homes/` - User-specific configurations.
- `modules/home/` - Defines Home Manager settings for applications, shell, coding tools, and languages.
- `overlays/` - Custom package overlays.
- `lib/` - Modular configuration helpers.
- `templates/` - Base templates for different modules and systems.

## Usage

To use this flake, ensure you have Nix and Home Manager installed. Then, run:

```sh
nix develop
home-manager switch
```

## Future Plans

- Complete NixOS and Darwin system definitions.
- Expand overlays and package customizations.

Feel free to explore and contribute!
