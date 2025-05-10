# ❄️ My Nix Flake

This is my personal [Nix](https://nixos.org/) flake configuration, designed to set up my development environment using Nix and [Home Manager](https://nix-community.github.io/home-manager/). It currently includes a variety of applications, development tools, and user-specific system configurations.

## ✨ Features

Here's a quick look at what this flake offers:

* **🏠 Home Manager Configuration**: Defines and manages applications and development tools specifically for my user environment.
* **🛠️ Development Tools**: Includes essential tools like:
    * [Podman](https://podman.io/)
    * [Git](https://git-scm.com/)
    * [Zed](https://zed.dev/)
* **💻 Programming Languages**: Provides configurations and potentially specific packages for:
    * Nix
    * Python
    * Golang
    * Rust
    * Bun
* **📄 Reusable Templates**: Offers base templates to streamline the creation of new:
    * Modules
    * Overlays
    * System configurations
* **📚 Leveraging `Denix`**: Utilizes the powerful [`yunfachi/denix`](https://github.com/yunfachi/denix) to enhance module and package management.
