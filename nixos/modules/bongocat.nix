{
  programs.wayland-bongocat = {
    enable = true;
    autoStart = true;
    catXOffset = 120;
    catYOffset = 0;

    catHeight = 40;
    overlayHeight = 60; 

    idleFrame = 0; 
    keypressDuration = 150; 
    fps = 60; 

    overlayOpacity = 0;

    inputDevices = [
      "/dev/input/event0" 
      "/dev/input/event1" 
    ];

    enableDebug = false; 
  };
}
