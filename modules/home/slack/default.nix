{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.slack;
in
{
  options.custom.modules.slack.enable = lib.mkEnableOption "Enable slack";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      slack
    ];
  };
}
