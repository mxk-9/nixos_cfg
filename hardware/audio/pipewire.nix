{ pkgs, ... }:
{
  # Section below must be turn off
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };
  hardware.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [
    qjackctl helvum pavucontrol pulseaudio
  ];
}
