{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.mysql80;
in
{
  options.custom.modules.mysql80.enable = lib.mkEnableOption "Enable mysql80";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      mysql80
    ];
  };
}
