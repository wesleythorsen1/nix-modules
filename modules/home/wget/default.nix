{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.wget;
in
{
  options.custom.modules.wget.enable = lib.mkEnableOption "Enable wget";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wget
    ];
  };
}
