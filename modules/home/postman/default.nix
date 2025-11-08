{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.postman;
in
{
  options.custom.modules.postman.enable = lib.mkEnableOption "Enable postman";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      postman
    ];
  };
}
