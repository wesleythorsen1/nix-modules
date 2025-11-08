{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.rsclock;
in
{
  options.custom.modules.rsclock.enable = lib.mkEnableOption "Enable rsclock";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      rsclock
    ];
  };
}
