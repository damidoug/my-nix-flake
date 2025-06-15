{
  delib,
  pkgs,
  ...
}: let
  containerPolicy = ''
    {
      "default": [
        {
          "type": "reject"
        }
      ],
      "transports": {
        "docker-daemon": {
          "": [{ "type": "insecureAcceptAnything" }]
        },
        "docker": {
          "docker.io": [
            {
              "type": "accept"
            }
          ],
          "quay.io": [
            {
              "type": "accept"
            }
          ],
          "my-registry.local:5000": [
            {
              "type": "insecureAcceptAnything"
            }
          ]
        }
      }
    }
  '';
  registryConfig = ''
    unqualified-search-registries = ["docker.io", "quay.io"]

    [[registry]]
    prefix = "docker.io"
    location = "registry-1.docker.io"

    [[registry]]
    prefix = "quay.io"
    location = "quay.io"

    [[registry]]
    prefix = "my-registry.local"
    location = "my-registry.local:5000"
    insecure = true
  '';
in
  delib.module {
    name = "cli.podman";

    options = delib.singleEnableOption false;

    home.ifEnabled = {
      home = {
        packages = with pkgs; [
          podman
          podman-compose
        ];
        file = {
          ".config/containers/policy.json".text = containerPolicy;
          ".config/containers/registries.conf".text = registryConfig;
        };
      };
      programs.zed-editor.extensions = [
        "dockerfile"
        "docker-compose"
      ];
    };
  }
