---
categories: english, 
author: Domen Kožar
date: 2009/09/18 11:28:00
title: "vnstat — useful CLI utility to get current network traffic rates"
draft: false
---
Today I was looking for a GNU tool to output current rates of networking traffic. Seems there is no
built-in tool in GNU Linux. 

I decided to go for third-party software and vnstat does it's job pretty good.


.. sourcecode:: console

    $ vnstat -i eth0 -tr
    6 packets sampled in 5 seconds
    Traffic average for wlan0

          rx           7.34 kB/s              9 packets/s
          tx           0.94 kB/s              7 packets/s


Add a little of `PandoraFMS <http://pandorafms.org/>`_ power, and we have a nice looking graph:)


