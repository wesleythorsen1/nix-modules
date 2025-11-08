{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.docker;
in
{
  options.custom.modules.docker.enable = lib.mkEnableOption "Enable docker";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      docker
    ];
  };
}
