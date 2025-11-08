{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.bws;
in
{
  options.custom.modules.bws.enable = lib.mkEnableOption "Enable bws";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bws
    ];
  };
}
