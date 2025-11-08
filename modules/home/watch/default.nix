{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.watch;
in
{
  options.custom.modules.watch.enable = lib.mkEnableOption "Enable watch";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      watch
    ];
  };
}
