	# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ashraf = {
    isNormalUser = true;
    description = "ashraf";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   # Text Editors and IDEs
   vim
   neovim
   emacs
   vscode
   sublime

   # Terminal and Shell
   kitty          # Terminal emulator
   tmux           # Terminal multiplexer
   zsh            # Z shell
   oh-my-zsh      # Zsh framework
   thefuck        # Command correction tool
   fastfetch      # System information tool
   sl 
   figlet
   fzf
   vimPlugins.fzfWrapper
   

   # Modern CLI Alternatives
   bat            # Better cat
   eza            # Better ls
   dust           # Better du
   zoxide         # Better cd
   ripgrep        # Better grep
   fd             # Better find
   htop           # Process viewer
   btop           # Better system monitor

   # File Management and Navigation
   ranger         # Terminal file manager
   tree           # Directory structure viewer
   ncdu           # Disk usage analyzer
   stow           # Dotfiles manager
   xclip          # Clipboard manager
   duf            # Disk usage utility

   # Web Browsers and Internet Tools
   firefox
   google-chrome
   brave
   curl
   wget
   httpie         # Better curl
   traceroute
   mtr            # Network diagnostic
   wireshark
   netcat
   socat

   # Development Tools
   git
   gh             # GitHub CLI
   lazygit        # Git TUI
   git-crypt      # Git encryption
   docker
   direnv
   nix-direnv
   shellcheck
   delta          # Better git diff
   
   # Data Processing
   jq             # JSON processor
   yq             # YAML processor

   # Build Tools
   gnumake
   cmake
   ninja

   # Programming Languages
   # -- C/C++
   gcc
   clang-tools
   
   # -- Python
   python3
   
   # -- Java
   jdk17
   gradle
   

   # GNOME Desktop Environment
   gnome-tweaks
   gnome-extension-manager
   eog            # Image viewer

   # GNOME Extensions
   gnomeExtensions.dock-from-dash
   gnomeExtensions.appindicator
   gnomeExtensions.search-light
   gnomeExtensions.bluetooth-battery
   gnomeExtensions.blur-my-shell
   gnomeExtensions.caffeine
   gnomeExtensions.clipboard-history
   gnomeExtensions.fuzzy-app-search
   gnomeExtensions.impatience
   gnomeExtensions.just-perfection
   gnomeExtensions.logo-menu
   gnomeExtensions.removable-drive-menu
   gnomeExtensions.steal-my-focus-window
   gnomeExtensions.tophat
   gnomeExtensions.transparent-top-bar

   # Media and Graphics
   vlc            # Media player
   spotify        # Music streaming
   gimp           # Image editor
   libreoffice-still 

   # Fonts
   (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })

   # System Monitoring and Debugging
   lsof           # List open files
  ];
  
# Also add this section to enable Zsh system-wide
programs.zsh = {
  enable = true;
  ohMyZsh.enable = true;
};

fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?



  nix.settings.experimental-features = ["nix-command" "flakes"];
}
