{channels, ...}: _final: _prev: {
  inherit (channels.bitwarden) bitwarden-desktop;
  inherit (channels.zen-browser) zen-browser-bin;
}
