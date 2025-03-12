{
  description = "";

  inputs = {
    # NixPkgs Unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # macOS Support
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Snowfall Lib
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: let
    lib = inputs.snowfall-lib.mkLib {
      inherit inputs;
      src = ./.;

      snowfall = {
        meta = {
          name = "dotfiles";
          title = "dotfiles";
        };

        namespace = "custom";
      };
    };
  in
    lib.mkFlake {
      inherit inputs;
      src = ./.;

      channels-config.allowUnfree = true;

      # Add modules to all NixOS systems.
      systems.modules.nixos = with inputs; [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            verbose = true;
            backupFileExtension = "backup";
          };
        }
      ];

      # Add modules to all Darwin systems.
      systems.modules.darwin = with inputs; [
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            verbose = true;
            backupFileExtension = "backup";
          };
        }
      ];

      templates = import ./templates {};
    };
}
