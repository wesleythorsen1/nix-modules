{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.davinci-resolve;
in
{
  options.custom.modules.davinci-resolve.enable = lib.mkEnableOption "Enable davinci-resolve";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      davinci-resolve
    ];
  };
}
