---
categories: english, ion, htpc, gentoo, xbmc
author: Domen Kožar
date: 2010/08/23 13:20:00
title: "Gentoo, ION 330 and XBMC == perfect HTPC"
draft: false
---
During last two days I managed to install my HTPC (soon I will add printers and samba to it). There
is a lot of useful information around the internet which helped me on the way. I really like to
create Gentoo from scratch logs, so I would like to share it with you together with used patches (in
my iElectric gentoo repository).

DISCLAIMER: This is far from perfect (even the ebuilds), but it works;)

DISCLAIMER2: I'm aware this is not the noobs guide, it's more of a reference manual

.. sourcecode:: console

    # some stolen from http://en.gentoo-wiki.com/wiki/Acer_Aspire_Revo_R3600_/_R3610#VDPAU

    * ping google.com
    * fdisk /dev/sda
    # boot partition
    n
    p
    1

    +30M
    # swap partition
    n
    p
    2

    +1G
    # root partition
    n
    p
    3


    w

    # create filesystems
    mkfs.ext2 /dev/sda1
    mkswap /dev/sda2
    mkfs.ext4 /dev/sda3

    # activate swap
    swapon /dev/sda2

    # prepare/mount chroot
    mount /dev/sda3 /mnt/gentoo
    mkdir /mnt/gentoo/boot
    mount /dev/sda1 /mnt/gentoo/boot
    cd /mnt/gentoo

    # stage3/portage download (use d shortcut for download)
    links http://www.gentoo.org/main/en/mirrors.xml
    server->releases->x86->current stage3 i686 + DIGEST + CONTENTS
    server->snapshosts->portage-latests + digest

    # validate size
    md5sum -c stage*.DIGEST
    md5sum -c portage*.md5sum

    # install portage/stage3
    tar xvjpf stage3-*.tar.bz2
    tar xvjf portage-latests.tar.bz2 -C /mnt/gentoo/usr

    # select mirrors (in terminal 2)
    mirrorselect -i -o >> /mnt/gentoo/etc/make.conf
    mirrorselect -i -r -o >> /mnt/gentoo/etc/make.conf
    # add slovenian mirror

    # copy dns settings
    cp -L /etc/resolv.conf /mnt/gentoo/etc/

    # create local portage overlay
    mkdir /mnt/gentoo/usr/local/portage

    # edit make.conf (back in terminal 1)
    vim /mnt/gentoo/etc/make.conf

    # chroot
    mount -t proc none /mnt/gentoo/proc
    mount -o bind /dev /mnt/gentoo/dev
    chroot /mnt/gentoo /bin/bash
    env-update
    . /etc/profile

    # refresh tree
    emerge --sync

    # select profile
    eselect profile list
    eselect profile set #n

    # emerge must-have stuff under install
    emerge -v vim eix pciutils gentoo-sources

    # setup slovene locale (terminal 2)
    vim /etc/locale.gen
    vim /etc/env.d/02locale
    locale-gen

    # setup slovene keymap
    vim /etc/conf.d/keymaps

    # setup zone
    cp /usr/share/zoneinfo/Europe/Ljubljana /etc/localtime

    # setup clock
    vim /etc/conf.d/clock

    # setup hostname
    vim /etc/conf.d/hostname (server.domain.si)

    # add basic startup scripts

    rc-update add net.eth0 default
    rc-update add sshd default

    # install distcc
    # http://www.gentoo.org/doc/en/distcc.xml
    # http://www.gentoo.org/doc/en/cross-compiling-distcc.xml
    emerge -av distcc
    vim /etc/distcc/hosts
    # do the magic in /usr/lib/distcc/bin/

    # compile kernel
    lspci (terminal 2)
    cd /usr/src/linux
    make menuconfig

    - kernel settings
    Procesesor type and features -->
      (Intel Atom) Processor family
    Power management and ACPI options -->
      CPU frequency scaling -->
        everything
    Device drivers -->
      Serial Ata and Parallel ATA drivers -->
        NVIDIA SATA support
      Networking drivers ->
        Ethernet (10 or 1000mbit) -->
          [M] nForce Ethernet support
        Wireless LAN -->
          Atheros Wireless Cards -->
            [M] everything
      Sound card support -->
        ALSA -->
          PCI Sound devices -->
            Intel HD Audio -->
              [*] everything
      [ ] Multiple devices driver support -->
        
    File systems ->
      [*] Ext2
      [*] Ext4
      [*] FUSE

    # compile kernel and place it
    make && make modules_install
    cp arch/i386/bzImage /boot/kernel-

    # add modules to startup
    vim /etc/modules.autoload.d/kernel2.6

    # set root password
    emerge -av pwgen dhcpcd grub
    pwgen
    passwd

    # create user
    # gost==guest
    useradd -m -G users,wheel,video,cdrom -U -s /bin/bash ielectric
    useradd -m -G users,video,cdrom -U -s /bin/bash gost

    # setup grub conf
    vim /boot/grub/grub.conf

    # setup fstab
    vim /etc/fstab

    # setup MBR
    grub --no-floppy
    root (hd0,0)
    setup (hd0)
    quit

    # cleanup and reboot
    rm /portage*
    rm /stage*

    reboot

    ### after basic OS setup

    # on local machine setup hosts
    vim /etc/hosts
    # back to server

    # setup rc.conf
    vim /etc/rc.conf

    # local: copy ssh key over
    cat ~/.ssh/id_rsa.pub | ssh server.domain.si "cat - >> ~/.ssh/authorized_keys"
    # back to remote
    chmod 744 /home/ielectric/.ssh/autorhized_keys

    # setup sshd
    vim /etc/ssh/sshd_config

    # system update
    eix-sync
    emerge -DuNav world

    # install autounmask flagedit
    emerge -av autounmask gentoolkit flagedit

    # eix and screen install
    emerge -av eix screen
    echo "*" > /etc/eix-sync.conf

    # layman
    flagedit app-portage/layman +subversion +git +mercurial
    emerge -av layman
    layman -a iElectric
    layman -a sunrise

    # ntp
    emerge -av ntp
    /etc/init.d/ntpd start
    /etc/init.d/ntp-client start
    rc-update add ntpd default
    rc-update add ntp-client default

    # update startup script
    rc-update add acpid default
    rc-update add nscd default
    rc-update add dbus default
    rc-update add hald default
    rc-update add consolekit default

    # bacula client
    flagedit app-backup/bacula +bacula-nodir +bacula-nosd +bacula-clientonly
    emerge -av bacula
    # update directory name in bacula-df.conf
    # update bacula-dir.conf on central server
    /etc/init.d/bacula-fd start
    rc-update add bacula-fd default

    # logrotate, syslog-ng, vixie-cron, slocate
    emerge -av slocate logrotate syslog-ng vixie-cron

    rc-update add syslog-ng default
    rc-update add vixie-cron default

    # munin
    echo "net-analyzer/munin postgres ssl" >> /etc/portage/package.use
    echo "x11-libs/cairo svg" >> /etc/portage/package.use
    emerge -av munin
    sudo -u munin munin-node-configure --shell | bash
    # update allowed host in /etc/munin/munin-node.conf
    # update munin.conf on central server
    /etc/init.d/munin-node start
    rc-update add munin-node default

    # update cronjob
    crontab -e
    slocate, eix-sync

    # random stuff
    emerge -av links mailx ntfs3g

    # xbmc
    # ebuild should be taken from iElectric overlay
    autounmask -a media-tv/xbmc-9.11-r5
    emerge -av xdm gdm gnome-session xbmc
    rc-update add xdm default

    # set default session to xbmc
    cd /etc/X11/Sessions/
    ln -s /usr/bin/xbmc-standalone
    vim /etc/rc.conf

    # switch to nvidia opengl implementation
    eselect opengl set 1

    # give guest user permissions for reboot/shutdown..
    polkit-auth --user gost --grant org.freedesktop.hal.power-management.reboot
    polkit-auth --user gost --grant org.freedesktop.hal.power-management.shutdown
    polkit-auth --user gost --grant org.freedesktop.hal.power-management.suspend

    # install transperancy skin
    cd /home/gost/.xbmc/skin/
    svn checkout http://transparency-xbmc.googlecode.com/svn/trunk/ Transparency

    # install svn repo installer
    http://marshalleq.wordpress.com/2009/08/22/how-to-install-svn-installer-on-xbmc-live-to-enable-automatic-skin-and-plugin-upgradesinstalls/

    # install OpenSubtitles OSD
    http://code.google.com/p/opensubtitles-osd/wiki/Instalation
    # go to scripts and setup the plugin
    # go to skin settings and enable subtitle OSD plugin -> default.py

    # install remote support
    # ebuild should be taken from iElectric overlay
    # BIG BIG THANKS to
    # http://forum.sabayon.org/viewtopic.php?f=56&t=20113&start=10#p114286
    autounmask -a app-misc/lirc-0.8.6-r4
    echo 'LIRC_DEVICES="wpc8769l"' >> /etc/make.conf
    emerge -av lirc
    rc-update add lirc default
    echo "lirc_wb677" >> /etc/modules.autoload.d/kernel-2.6

    # check if everything boots correctly
    reboot

    # TODO: list of all conf files
    # TODO esata?

Less than 300 lines to install Gentoo HTPC, not bad :)

Cheers, Domen

**UPDATE: fixed typo and added dummy module for lirc**
