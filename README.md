# ll-devel (Work-in-progress)
Generazione file .ISO da Kickstart files
----------
26/06/2018
----------
LAMBRATE LINUX - HOWTO RPM Build
(rif: https://fedoraproject.org/wiki/How_to_create_an_RPM_package/it)
(rif: https://wiki.centos.org/HowTos/SetupRpmBuildEnvironment)
---------------
Pre-requisiti: 
# dnf install make gcc rpm-build redhat-rpm-config
$ mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
$ echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros
---------------

Per generare la nuova .iso è necessario scaricare da qui:

1) https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Workstation/source/tree/Packages/g/
2) https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Workstation/source/tree/Packages/f/

i seguenti pacchetti con i sorgenti (.src.rpm):

generic-release-29-0.1.fc29.src.rpm
generic-logos-18.0.0-5.fc28.src.rpm
f28-backgrounds-28.1.4-1.fc29.src.rpm

-Tutti questi pacchetti vanno copiati in ~/rpmbuils
----------------------------------------------------------------
Creiamo una struttura nella cartella /home/nome-utente con il comando:
$ rpmdev-setuptree
----------------------------------------------------------------

Iniziamo a lavorare con: generic-release-29-0.1.fc29.src.rpm

- Estraiamo il solo file .spec in: ~/rpmbuils/SPEC
- Editiamo il file "generic-release.spec" e con la funzione TROVA/SOSTITUISCI al posto di "Fedora" scriviamo per tutto il file "LambrateLinux" e poi salviamo il file come "LambrateLinux-release.spec".

-Estraiamo tutti gli altri file:
___$ ls 
  80-server.preset           LICENSE
  80-workstation.preset      org.gnome.shell.gschema.override
  85-display-manager.preset  README.developers
  90-default.preset          README.Generic-Release-Notes
  99-default-disable.preset  README.license
  convert-to-edition.lua___
in: ~/rpmbuils/SOURCE
-Editiamo il file README.Generic-Release.Notes e con la funzione TROVA/SOSTITUISCI al posto di "Fedora" scriviamo per tutto il file "LambrateLinux" e poi salviamo.
-Rinominiamo il file: ~/rpmbuild/SOURCES/README.Generic-Release-Notes con "README.LambrateLinux-Release-Notes

----------------------------------------------------------------
-Posizioniamoci in: ~/rpmbuils/SPEC
e diamo il comando:
$ rpmbuild -ba LambrateLinux-release.spec

FATTO! in ~/rpmbuils/RPMS sono stati generati i file .rpm.
----------------------------------------------------------------
-La dir di lavoro è ~/rpmbuild, creiamo una copia di: ~/rpmbuils in ~/rpmbuils-BACKUP per sicurezza.
-------------------------------------------------------------------------------
Ora è necessario introdurre un repo locale nella struttura:
la procedura è la seguente:

1) dare il comando per installare il plugin di dnf:
# dnf install createrepo --allowerasing

2) creare una dir con i pacchetti ,rpm generati da rpmbuild:
~/rpmLLrepo/

3) copiare in questa dir il/i pacchetto/i generati con rpmbuild:
 LambrateLinux-release-29-0.1.fc29.x86_64

4) dare il comando di creazione del repo locale:
# createrepo -v ~/rpmLLrepo/

Si procede editando come superutente il file: ~/LL29-devel-WS/fedora-repo-rawhide.ks
inserendo in fondo la riga che punta al repo locale generato come sopra:

repo --name=rpmLLrepo --includepkgs=LambrateLinux-release,LambrateLinux-release-notes,f28-backgrounds-base,f28-backgrounds-extras-base,f28-backgrounds-gnome --baseurl=file:///home/idraulico/rpmLLrepo/

Editare anche il file: ~/LL29-devel-WS/fedora-pacchetti-si-no.ks
inserendo un "-" a "generic-release" in modo che sia sostituito da "LambrateLinux-release".
-------------------------------------------------------------------------------
ATTENZIONE: Tutte le volte che si aggiunge nel repo locale "rpmLLrepo" un pacchetto generato con rpmbuild bisogna ridare il comando:
# createrepo -v ~/rpmLLrepo/
-------------------------------------------------------------------------------

Continuiamo a lavorare con: f28-backgrounds-28.1.4-1.fc29.src.rpm

-Estraiamo il solo file .spec in: ~/rpmbuils/SPEC

-Editiamo il file "f28-backgrounds.spec" e con la funzione TROVA/SOSTITUISCI al posto di "Fedora" scriviamo per tutto il file "LambrateLinux" 
-sulla riga %global relnum 28 scriviamo %global relnum 29
-sulla riga %global Bg_Name F%{relnum} scriviamo %global Bg_Name LL%{relnum}

e poi salviamo il file come "LL29-backgrounds.spec".

-Estraiamo i file f28-backgrounds-28.1.4.tar.xz e metadata.desktop in ~/rpmbuils/SOURCE
-Estraiamo il file f28-backgrounds-28.1.4.tar.xz nella dir f28-backgrounds

-modificare adeguatamente i file:
Attribution
Attribution-Extras
Makefile

-Dopo tutte le modifiche precedenti effettuare una copia della dir f28-backgrounds e poi rinominarla
f28-backgrounds   ------>   LL29-backgrounds
-Generare un file compresso della dir "LL29-backgrounds" con click-dx ----> comprimi, generando un file:
 LL29-backgrounds-29.1.4.tar.xz

----------------------------------------------------------------
-Posizioniamoci in: ~/rpmbuils/SPEC
e diamo il comando:
$ rpmbuild -ba LL29-backgrounds.spec
