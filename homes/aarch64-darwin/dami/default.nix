{
  lib,
  namespace,
  ...
}:
with lib.${namespace}; {
  ${namespace} = {
    apps = enabled;
    coding = {
      lang = {
        golang = enabled;
        javascript = enabled;
        lua = enabled;
        nix = enabled;
        python = enabled;
        rust = enabled;
      };
      tools = {
        podman = enabled;
        git = enabled;
        treefmt = enabled;
        zed = enabled;
      };
    };
    shell = enabled;
  };
}
