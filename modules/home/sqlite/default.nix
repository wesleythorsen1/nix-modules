{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.sqlite;
in
{
  options.custom.modules.sqlite.enable = lib.mkEnableOption "Enable SQLite tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      litecli # cli
      #TODO: Add option to enable SQLite engine
    ];
  };
}
