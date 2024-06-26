#!/bin/sh

apk add flatpak flatpak-builder

if [ -f "./winbox.flatpak" ]; then rm ./winbox.flatpak; fi

echo "add repo & install dependencies"
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user --noninteractive install org.freedesktop.Platform/x86_64/22.08
flatpak --user --noninteractive install runtime/org.freedesktop.Sdk/x86_64/22.08
flatpak --user --noninteractive install org.winehq.Wine/x86_64/stable-22.08

echo "Build"
flatpak-builder --force-clean winbox com.github.thethink3r.winbox.yml >/dev/null

echo "build-export"
flatpak build-export export winbox >/dev/null

echo "build-bundle"
flatpak build-bundle export winbox.flatpak com.github.thethink3r.winbox >/dev/null


echo "Cleanup"
if [ -d "./.flatpak-builder" ]; then rm -rf ./.flatpak-builder; fi
if [ -d "./export" ]; then rm -rf ./export; fi
if [ -d "./winbox" ]; then rm -rf ./winbox; fi
