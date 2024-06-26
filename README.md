# winbox
winbox flatpak with darkmode

![Screenshot](Screenshot.png?raw=true "Screenshot")


# build yourself
```bash
git clone https://github.com/thethink3r/winbox.git
cd winbox
./build.sh
```
## Requirements
```bash
apt install flatpak-builder
flatpak install org.freedesktop.Sdk
```

# Install via Docker

```bash
docker run --network host --privileged --volume "${PWD}":/tmp/sdk/ --name flatpak -it alpine /bin/sh -c 'cd /tmp/sdk/; ./build_docker.sh'

flatpak install --user org.winehq.Wine/x86_64/stable-22.08
flatpak install --user org.freedesktop.Platform/x86_64/22.08
flatpak install --user runtime/org.freedesktop.Sdk/x86_64/22.08

# install from local file
flatpak install --user winbox.flatpak

# cleanup (because of root:root ownership)
docker run --network host --privileged --volume "${PWD}":/tmp/sdk/ --name flatpak -it alpine /bin/sh -c 'cd /tmp/sdk/; rm winbox.flatpak'
```


# Install via winbox.flatpak


## 1. Install Runtime Requirements:
```bash
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user install org.freedesktop.Platform/x86_64/22.08
flatpak --user install org.winehq.Wine/x86_64/stable-22.08
```
## 2. Install flatpak
```bash
flatpak --user install winbox.flatpak
```


## :exclamation:Note 

First Start darkmode not enable -> close and restart Application

Menu entry / icon is visible after reboot


