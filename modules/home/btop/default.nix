{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.btop;
in
{
  options.custom.modules.btop.enable = lib.mkEnableOption "Enable btop";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      btop
    ];
  };
}
