# Noctalia-NixOS-Sample
Sample NixOS configurations with flakes for Umbriel + Noctalia + Noctalia Greeter

## Why?
Because NixOS has one massive problem: how do we even start this thing? I am here to ease that gap. It won't be perfect but at least it's better than nothing.

## Goal
The config is intentionally minimal and simple to understand. Only nixpkgs umbriel and noctalia are flakes while other stuff are simple and straightforward. No elaborate abstraction like home manager, hjem, impermenance or dendritic.
In fact, the config alone is ready to be used for everyday basis with only some minor adjustments for your hardware.

## Things that you need to do first before using these config
1. **I DO NOT PROVIDE** `hardware-configuration.nix`. Your folder should contain at least these: `flake.nix` `configuration.nix` and `hardware-configuration.nix`. `flake.lock` will be automatically generated. **Do not manually edit it.**
2. Change username and hostname. I do not specify username or hostname. Give these config a read and change them appropriately.
3. I use Asia/Bangkok as timezone because it is my timezone. Change it to something else if you don't live on this timezone.
4. I use nh with setup on ~/nixos. You may change the location if you don't like your configuration being on home folders. But I really think it's convenient.
5. You do not need to fully master Nix to use this config. But at least use pattern recognition to realize what the config does. And honestly? that's enough.

## Explaining Defaults
- Foot as terminal: most simple terminal for wayland. If you want other options, change it.
- Firefox as browser: I am not interested in browser war. I use Helium Browser myself but I think Firefox is enough for you to look up and change your stuff.
- Papirus Icons: Most basic icon theme ever. It works.
- Bibata Cursor: Same logic as Papirus
- Thunar as File Manager: Lightweight, fast, and easy to use. It even has community template from Noctalia too.
