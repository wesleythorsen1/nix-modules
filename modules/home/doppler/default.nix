{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.doppler;
in
{
  options.custom.modules.doppler.enable = lib.mkEnableOption "Enable doppler";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      doppler
    ];
  };
}
