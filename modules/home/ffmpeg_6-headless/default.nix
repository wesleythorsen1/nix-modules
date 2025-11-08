{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.ffmpeg_6-headless;
in
{
  options.custom.modules.ffmpeg_6-headless.enable = lib.mkEnableOption "Enable ffmpeg_6-headless";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ffmpeg_6-headless
    ];
  };
}
