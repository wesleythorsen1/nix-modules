{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.deno;
in
{
  options.custom.modules.deno.enable = lib.mkEnableOption "Enable deno";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      deno
    ];
  };
}
