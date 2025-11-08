{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.sd;
in
{
  options.custom.modules.sd.enable = lib.mkEnableOption "Enable sd";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      sd
    ];
  };
}
