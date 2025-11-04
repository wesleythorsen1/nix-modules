{
  config,
  lib,
  ...
}:

{
  options.custom = {
    enable = lib.mkEnableOption "enable/disable all custom modules";
    modules = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };

  imports = [
    ./golang
  ];

  config = lib.mkIf config.custom.enable {
    # Optional: global on/off gate
  };
}
