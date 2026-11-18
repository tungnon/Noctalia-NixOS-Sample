# Noctalia-NixOS-Sample
Sample NixOS configurations with flakes for Umbriel + Noctalia + Noctalia Greeter + Luciole

## Why?
Because NixOS has one massive problem: how do we even start this thing? I am here to ease that gap. It won't be perfect but at least it's better than nothing.

## Goal
The config is intentionally minimal and simple to understand. Only nixpkgs umbriel noctalia and luciole are flakes while other stuff are simple and straightforward. No elaborate abstraction like home manager, hjem, impermenance or dendritic.
In fact, the config alone is ready to be used for everyday basis with only some minor adjustments for your hardware.

## Target Audiences
If this is first time you are using Linux, go back. This rabbit hole isn't for you. If you are Arch user? Welcome this thing is for you.

## Things that you need to do first before using these config
1. **I DO NOT PROVIDE** `hardware-configuration.nix`. Your folder should contain at least these: `flake.nix` `configuration.nix` and `hardware-configuration.nix`. `flake.lock` will be automatically generated. **Do not manually edit it.**
2. Change username and hostname. I do not specify username or hostname. Give these config a read and change them appropriately.
3. I use Asia/Bangkok as timezone because it is my timezone. Change it to something else if you don't live on this timezone.
4. I use nh with setup on ~/nixos. You may change the location if you don't like your configuration being on home folders. But I really think it's convenient.
5. You do not need to fully master Nix to use this config. But at least use pattern recognition to realize what the config does. And honestly? that's enough.
6. If you still don't know what to do, just install GNOME or KDE Plasma from NixOS calamares installer then use hardware-configuration.nix from it then use that working environment to develop with this sample config.

## Explaining Defaults
- Umbriel + Noctalia + Noctalia Greeter: While greeter is not even needed (I use ly myself), this is a sample config to demonstrate Noctalia ecosystem.
- Luciole as file manager: technically not needed but it offers best noctalia experience so why not add it here?
- nh: Once you know how to use nh, you can't practically go back using "official commands".
- Latest Kernel: I would rather have modern computer working than gambling with LTS kernel which may not work with new hardware.
- Foot as terminal: most simple terminal for wayland. If you want other options, change it.
- Firefox as browser: I am not interested in browser war. I use Helium Browser myself but I think Firefox is enough for you to look up and change your stuff.
- Papirus Icons: Most basic icon theme ever. It works.
- Bibata Cursor: Same logic as Papirus
- Noto fonts: Same shit as above
- nwg-look: This setup is GTK centric, so GUI GTK config tool fits here.

