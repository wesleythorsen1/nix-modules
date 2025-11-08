{
  config,
  lib,
  ...
}:

{
  options.custom = {
    enable = lib.mkEnableOption "enable/disable all custom modules";
  };

  imports = [
    ./dotnet
    ./fd
    ./fzf
    ./git
    ./gh
    ./golang
  ];

  config = lib.mkIf config.custom.enable {
    # Optional: global on/off gate
  };
}
