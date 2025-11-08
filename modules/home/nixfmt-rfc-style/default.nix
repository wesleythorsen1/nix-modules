{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.nixfmt-rfc-style;
in
{
  options.custom.modules.nixfmt-rfc-style.enable = lib.mkEnableOption "Enable nixfmt-rfc-style";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nixfmt-rfc-style
    ];
  };
}
