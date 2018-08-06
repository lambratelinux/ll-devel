#!/bin/bash

#ksflatten -c fedora-live-cinnamon.ks -o flat-fedora-live-cinnamon.ks

#livecd-creator --verbose --config=ll-live-cinnamon-it_IT.ks --fslabel=Lambrate-Linux --cache=/var/cache/live

#livemedia-creator --ks ll-live-cinnamon-it_IT.ks --resultdir /var/lmc/ --project Lambrate-Linux --make-iso --volid Lambrate-Linux --iso-only --iso-name Lambrate-Linux.iso --releasever 25 --title Lambrate-Linux --macboot --no-virt

#dnf clean all

setenforce 0

livemedia-creator --ks ll-live-workstation.ks --resultdir /home/idraulico/ll-devel/LL.iso --project Lambrate-Linux --make-iso --volid Lambrate-Linux --iso-only --iso-name Lambrate-Linux.iso --releasever 29 --title Lambrate-Linux --macboot --no-virt

