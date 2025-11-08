{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.jq;
in
{
  options.custom.modules.jq.enable = lib.mkEnableOption "Enable jq";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      jq
    ];
  };
}
