{
  ...
}:

{
  # options.custom = {
  #   enable = lib.mkEnableOption "enable/disable all custom modules";
  # };

  imports = [
    ./dotnet
    ./fd
    ./fzf
    ./git
    ./gh
    ./golang
    ./pbfmt
  ];

  # Optional: global on/off gate
  # config = lib.mkIf config.custom.enable { };
}
