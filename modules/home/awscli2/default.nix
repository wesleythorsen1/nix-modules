{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.awscli2;
in
{
  options.custom.modules.awscli2.enable = lib.mkEnableOption "Enable awscli2";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      awscli2
    ];
  };
}
