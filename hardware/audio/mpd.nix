{ ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/sny/Music";
  };

  # for MPD
  services.mpd = {
    extraConfig = ''
  	  audio_output {
  	    type "pipewire"
  	    name "My PipeWire Output"
  	  }
  	'';
    # user = "sny";
  };
}
