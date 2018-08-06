# LAMBRATE LINUX (distribuzione derivata da Fedora Rawhide)
# https://lambratelinux.github.io/ll
# email:lambartelinux@gmail.com
# ll-pacchetti-si-no.ks
# file incluso in: ll-live-workstation.ks

%packages

#################Lambrate Linux Gnome Desktop##############
@gnome-desktop

#################Lambrate Linux Cinnamon Desktop##############
#@cinnamon-desktop

#################Lambrate Linux XFCE Desktop##############
#@xfce
#@xfce-desktop
#@xfce-apps
#@xfce-extra-plugins
#@xfce-media
#@xfce-office

# pacchetti aggiunti a quelli standard
guake
beesu
nano
thunar
kmahjongg
crack-attack
kpat
pinball
aisleriot
claws-mail 
gedit 
gparted
lshw
pluma 
gpm
sound-juicer
grip
#akmods
#akmod-wl
#kernel-devel

# lingua italiana
#libreoffice-langpack-it

# @multimedia
#PackageKit-gstreamer-plugin
#gstreamer-plugins-bad-free
#gstreamer-plugins-good

# Graphics
#sane-backends-drivers-cameras
#sane-backends-drivers-scanners

# Multimedia
#gstreamer-ffmpeg
#gstreamer*-libav
#gstreamer*-vaapi
#gstreamer*-plugins-bad
#gstreamer*-plugins-bad-*free
#gstreamer*-plugins-bad-freeworld
#gstreamer*-plugins-good
#gstreamer*-plugins-ugly
#libdvdcss
#vlc

#Lambrate-Linux is a FEDORA REMIX
-fedora-release
-fedora-logos
-generic-release
-f28-backgrounds-base
-f28-backgrounds-gnome
generic-logos

# extra backgrounds
-f28-backgrounds-extras-gnome

#-iwl7260-firmware
#-iwl5150-firmware
#-langpacks-it

########## Pacchetti NON voluti
#-PackageKit-command*
#-abrt*
#-bash-completion*
#-fpaste
#-initial-setup
#-rsyslog
#-sendmail
#-f24-backgrounds-extras-base
#-f24-backgrounds-extras-gnome
#-f25-backgrounds-base
#-f25-backgrounds-gnome
#-desktop-backgrounds-basic
#-desktop-backgrounds-compat
#-desktop-backgrounds-gnome

# Audio
#alsa-plugins-pulseaudio
#alsa-utils
pulseaudio
pulseaudio-module-x11
pulseaudio-utils

# Fonts
google-noto-sans-fonts
google-noto-serif-fonts
google-droid-sans-mono-fonts
liberation-mono-fonts
liberation-s*-fonts

# Tools
#@networkmanager-submodules
#htop
#vim-enhanced
#unrar

# Package management
#dnf-plugins-core

%end

