{
  lib,
  config,
  ...
}:

let
  cfg = config.custom.modules.fzf;
in
{
  options.custom.modules.fzf = {
    enable = lib.mkEnableOption "Enable fzf";
  };

  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
    };
  };
}
