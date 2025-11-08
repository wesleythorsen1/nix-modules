{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.ngrok;
in
{
  options.custom.modules.ngrok.enable = lib.mkEnableOption "Enable ngrok";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ngrok
    ];
  };
}
