{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    # ./hardware-configuration.nix **THIS IS NOT PROVIDED**
    inputs.umbriel.nixosModules.default
    inputs.noctalia.nixosModules.default
  ];

  # Flakes Stuff
  nix.settings = {
    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://umbriel.cachix.org"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw="
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Bootloader - Do not touch it unless you know what you are doing
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # SPECIFY YOUR HOSTNAME HERE
  networking.hostName = "YOURHOSTNAMEHERE";

  # SPECIFY YOUR TIMEZONE HERE
  time.timeZone = "Asia/Bangkok";

  # Unless you are ideological, you are better off enabling unfree software. It's more pragmatic this way.
  nixpkgs.config.allowUnfree = true;

  # Audio stack
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Define a user account
  users.users.YOURUSERNAME = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  # Umbriel - Port umbriel config from your previous install is enough
  programs.umbriel.enable = true;

  # Noctalia - Config Noctalia from GUI is a valid choice. You don't have to declare everything.
  programs.noctalia = {
    enable = true;
    systemd = {
      enable = true;
      target = "umbriel-session.target"; # So it autostarts with umbriel
    };
    recommendedServices.enable = true;     # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
  };

  # Noctalia Greeter - Config noctalia greeter here
  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      cursor.size = 24;
      keyboard.layout = "us";
      keyboard.numlock = true; # Thanks me later
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };

  # Polkit - Disable if you hate yourself
  security.polkit.enable = true;

  # Font - Standard fonts stuff
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  # nh - Trust me, this makes your life easier. Look up nh if you are curious.
  programs.nh = {
    enable = true;
    flake = "/home/YOURUSERNAME/nixos"; #CHANGE DIRECTORIES IF NEEDED
  };

  # Thunar - Most basic file manager ever.
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  programs.xfconf.enable = true;
  services.udisks2.enable = true;

  # GNOME Keyring - Standard keyring
  services.gnome.gnome-keyring.enable = true;

  # Declare environment variables
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk3";  # CHANGE GTK3 TO SOMETHING ELSE IF NEEDED
  };

  # CHANGE YOUR BROWSER HERE
  programs.firefox.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    xdg-user-dirs # so your home folders actually have icons
    papirus-icon-theme # change icon is needed
    bibata-cursors # change cursor if needed
    nwg-look # change gtk3 settings here
    adw-gtk3 # default gtk3 theme
    wl-clipboard # clipboard for wayland duh
    ffmpegthumbnailer # for Thunar video thumbnails
    foot # change to something else
    file-roller # use with thunar
  ];

  # Compatibility version, NOT your NixOS version
  # For fresh installs, use the version you installed with
  # For existing installs, KEEP your original value even after upgrading NixOS
  system.stateVersion = "26.05"; 

}
