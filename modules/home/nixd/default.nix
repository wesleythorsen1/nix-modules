{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.nixd;
in
{
  options.custom.modules.nixd.enable = lib.mkEnableOption "Enable nixd";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nixd
    ];
  };
}
