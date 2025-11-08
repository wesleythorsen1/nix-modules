{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.bat;
in
{
  options.custom.modules.bat.enable = lib.mkEnableOption "Enable bat";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bat
    ];
  };
}
