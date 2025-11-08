{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.podman;
in
{
  options.custom.modules.podman = {
    enable = lib.mkEnableOption "Enable podman";
    enableDesktop = lib.mkOption {
      type = lib.types.bool;
      description = "install the podman-desktop package";
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.podman
    ]
    ++ (lib.lists.optional cfg.enableDesktop pkgs.podman-desktop);
  };
}
