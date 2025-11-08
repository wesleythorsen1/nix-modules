{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.claude-code;
in
{
  options.custom.modules.claude-code.enable = lib.mkEnableOption "Enable claude-code";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      claude-code
    ];
  };
}
