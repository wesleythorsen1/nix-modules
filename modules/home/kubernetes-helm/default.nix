{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.kubernetes-helm;
in
{
  options.custom.modules.kubernetes-helm.enable = lib.mkEnableOption "Enable kubernetes-helm";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      kubernetes-helm
    ];
  };
}
