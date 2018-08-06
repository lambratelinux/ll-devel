repo --name=rawhide --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=rawhide&arch=$basearch
url --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=rawhide&arch=$basearch

repo --name=rawhide-rpmfusion-free --baseurl=https://download1.rpmfusion.org/free/fedora/development/rawhide/Everything/x86_64/os/
url --url=https://download1.rpmfusion.org/free/fedora/development/rawhide/Everything/x86_64/os/

repo --name=rawhide-rpmfusion-nonfree --baseurl=https://download1.rpmfusion.org/free/fedora/development/rawhide/Everything/x86_64/os/
url --url=https://download1.rpmfusion.org/nonfree/fedora/development/rawhide/Everything/x86_64/os/

repo --name=rpmLLrepo --includepkgs=LambrateLinux-release,LambrateLinux-release-notes,f25-backgrounds-base,f25-backgrounds-gnome --baseurl=file:///home/idraulico/rpmLLrepo/
url --url=file:///home/idraulico/rpmLLrepo/
