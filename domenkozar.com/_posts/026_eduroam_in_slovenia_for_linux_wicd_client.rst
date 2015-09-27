---
categories: english, eduroam, opensource, linux
author: Domen Kožar
date: 2010/04/14 08:59:00
title: "Eduroam in Slovenia for Linux wicd client"
draft: false
---
After year and a half on `Faculty of Electrical Engineering <http://www.fe.uni-lj.si>`_, I have
managed to get working `Eduroam WPA enterprise encryption <http://www.eduroam.org>`_ on `wicd
<http://wicd.sourceforge.net/>`_ networking client for GNU Linux (pretty good alternative to
`NetworkManager <http://projects.gnome.org/NetworkManager/>`_, but with Unix philosophy in mind).

Here is wicd encryption template for wpa_supplicant:


.. sourcecode:: bash

    name = eap-ttls (Eduroam sl)
    version = 1
    require anon_identity *Anonymous_Identity ca_cert *Path_to_CA_Cert identity *Identity password *Password
    ----
    eapol_version=1
    ap_scan=1
    ctrl_interface=/var/run/wpa_supplicant
    network={
        ssid="$_ESSID"
        scan_ssid=$_SCAN
        proto=WPA WPA2
        key_mgmt=WPA-EAP
        group=CCMP TKIP
        eap=TTLS
        mixed_cell=1
        peerkey=1
        phase2="auth=PAP"
        ca_cert="$_CA_CERT"
        anonymous_identity="$_ANON_IDENTITY"
        identity="$_IDENTITY"
        password="$_PASSWORD"
    }

Cacert is actually not needed, but if I understand correctly it provides encryption for data
traffic. Here is full procedure how to get eduroam working with wicd: 

* **Install wicd for your favourite Linux distribution**
* $ emerge -av wicd
* **Copy template to wicd**
* $ cp eap-ttls > /etc/wicd/encrpytion/templates
* **Make template active**
* $ echo "eap-ttls" >> /etc/wicd/encryption/tempalates/active
* **Start wicd**
* $ sudo /etc/init.d/wicd start
* $ wicd-client
* **When configuring eduroam, select eap-ttls template and provide username, password, path to
  cacert.der and anonymous identity**

PS: thanks to `@brodul <http://twitter.com/brodul>`_ for low level debugging of wpa_supplicant.
