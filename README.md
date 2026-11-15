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
3. I use nh with setup on ~/nixos. You may change the location if you don't like your configuration being on home folders. But I really think it's convenient.
4. You do not need to fully master Nix to use this config. But at least use pattern recognition to realize what the config does. And honestly? that's enough.
