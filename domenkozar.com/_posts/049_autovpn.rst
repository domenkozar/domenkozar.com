---
categories: english, privacy
author: Domen Kožar
date: 2012/01/01 21:00:00
title: "AutoVPN: auto connect VPN if network is active and reconnect if VPN connection drops"
draft: false
---

After unsuccessful try on `reddit.com <http://www.reddit.com/r/linux/comments/nxhu9/help_getting_bug_fixed_in_networkmanager_so_that/>`_,
someone pointed me to a Python script that almost did what I wanted. Changed it a bit (works only with NetworkManager 0.9.x branch) and got: https://gist.github.com/1547663

Usage
=====

First parameter to script is VPN connection name in NetworkManager and second are
comma separated names of networks that should be ignored (using VPN connection at home is useless).

- clone gist somewhere (eg. git clone git://gist.github.com/1547663.git /home/user/autovpn/)
- add to /etc/rc.local: python /home/user/autovpn/autovpn.py "myvpn" 'Auto homenetwork,Auto worknetwork' > /var/log/autovpn.log&
- reboot :-)

