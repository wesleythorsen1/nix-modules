{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.fontconfig;
in
{
  options.custom.modules.fontconfig.enable = lib.mkEnableOption "Enable fontconfig";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      fontconfig
    ];
  };
}
