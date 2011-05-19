---
categories: english, python, gae, monitoring
author: Domen Kožar
date: 2010/07/19 18:11:00
title: "Your personal, free webpage monitoring (powered by google app engine)"
draft: false
---
Thanks to http://xercestech.com/app-engine-server-monitor.geek

Go to https://appengine.google.com/ and register application with {app-name}

::

    wget http://googleappengine.googlecode.com/files/google_appengine_1.3.5.zip
    unzip google_appengine_1.3.5.zip
    cd google_appengine
    git clone git://github.com/mrsteveman1/aeservmon.git {app-name}
    vim {app-name}/app.yaml # set application
    python appcfg.py update {app-name}

Result: http://web-monitoring.appspot.com/


