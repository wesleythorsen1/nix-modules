{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.getoptions;
in
{
  options.custom.modules.getoptions.enable = lib.mkEnableOption "Enable getoptions";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      getoptions
    ];
  };
}
