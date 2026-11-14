{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
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

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # CHANGE TO SOMETHING ELSE
  networking.hostName = "YOURHOSTNAMEHERE";

  # Set your time zone.
  time.timeZone = "Asia/Bangkok";

  # REQUIRED IF YOU WANT STEAM
  nixpkgs.config.allowUnfree = true;

  # Audio
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

  # Umbriel
  programs.umbriel.enable = true;

  # Noctalia
  programs.noctalia = {
    enable = true;
    # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
    recommendedServices.enable = true;
  };

  # Noctalia Greeter
  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      cursor.size = 24;
      keyboard.layout = "us";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };

  # Polkit (is this needed?)
  security.polkit.enable = true;

  # Font
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  # nh
  programs.nh = {
    enable = true;
    flake = "/home/YOURUSERNAME/nixos"; #CHANGE DIRECTORIES IF NEEDED
  };

  # Thunar
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  programs.xfconf.enable = true;
  services.udisks2.enable = true;

  # GNOME Keyring
  services.gnome.gnome-keyring.enable = true;

  # CHANGE GTK3 TO SOMETHING ELSE IF NEEDED
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk3";
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

  system.stateVersion = "26.05"; # Did you read the comment?

}
