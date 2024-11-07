#!/usr/bin/env bash
sleep 1
systemctl --user stop xdg-desktop-portal-hyprland.service
systemctl --user stop xdg-desktop-portal.service
systemctl --user start xdg-desktop-portal-hyprland.service
sleep 2
systemctl --user start xdg-desktop-portal.service
