{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.zulu24;
in
{
  options.custom.modules.zulu24.enable = lib.mkEnableOption "Enable zulu24 (Java)";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      zulu24
    ];
  };
}
