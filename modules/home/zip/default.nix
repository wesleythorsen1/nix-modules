{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.zip;
in
{
  options.custom.modules.zip.enable = lib.mkEnableOption "Enable zip";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      zip
    ];
  };
}
