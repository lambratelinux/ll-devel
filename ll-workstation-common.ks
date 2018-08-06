# LAMBRATE LINUX (distribuzione derivata da Fedora Rawhide)
# https://lambratelinux.github.io/ll
# mailto:lambartelinux@gmail.com
# ll-workstation-common.ks
# file incluso in: ll-live-workstation.ks

%packages

# Exclude unwanted groups that fedora-live-base.ks pulls in
-@dial-up
-@input-methods
-@standard

# Make sure to sync any additions / removals done here with
# workstation-product-environment in comps
@firefox

#I prossimi pacchetti sono anche in fedora-live.base.ks 
#@base-x
#@core
#@fonts

@libreoffice
@networkmanager-submodules
#@workstation-product

# Exclude unwanted packages from @anaconda-tools group
-gfs2-utils
-reiserfs-utils

%end

