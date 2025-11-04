{
  lib,
  config,
  ...
}:

let
  cfg = config.custom.modules.fd;
in
{
  options.custom.modules.fd = {
    enable = lib.mkEnableOption "Enable fd";

    hidden = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };

    ignores = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        ".git/"
        "node_modules/"
      ];
    };
  };

  config = lib.mkIf cfg.enable {
    programs.fd = {
      enable = true;
      hidden = cfg.hidden;
      ignores = cfg.ignores;
    };
  };
}
