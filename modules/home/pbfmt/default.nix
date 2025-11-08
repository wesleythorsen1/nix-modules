{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.custom.modules.pbfmt;
in
{
  options.custom.modules.pbfmt = {
    enable = lib.mkEnableOption "Enable pbfmt";
  };

  config = lib.mkIf cfg.enable {
    assertions = lib.mkIf cfg.enable [
      {
        assertion = pkgs.pbfmt != null;
        message = "`pkgs.pbfmt` missing. Use the `nix-modules.overlays.default` overlay.";
      }
    ];

    home.packages = [ pkgs.pbfmt ];
  };
}
