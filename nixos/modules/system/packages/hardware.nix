{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Monitor / peripheral control
    ddcutil ddccontrol
    #overskride

    #usb-modeswitch удалить если не реалтек а если реалтек то раскоментируй
    #usb-modeswitch-data удалить если не реалтек а если реалтек то раскоментируй

  ];
}
