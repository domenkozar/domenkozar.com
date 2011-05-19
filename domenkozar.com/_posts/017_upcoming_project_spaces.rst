---
categories: english, 
author: Domen Kožar
date: 2010/01/02 23:00:00
title: "upcoming project: spaces"
draft: false
---
I have been thinking about my development issue for a while. Working on many projects and quick
switching is a pain. I could not find a solution that even thouches this subject, so I started my
own development project management called **spaces**. 

Here is the basic configuration file (in YAML) that already works:


.. sourcecode:: yaml

    --- !project
    name: gspaces

    --- !chromium-browser
    urls:
        - http://docs.python.org/dev/library/logging.html
        - http://docs.python.org/dev/library/subprocess.html
        - http://docs.python.org/dev/library/optparse.html
        - http://en.wikipedia.org/wiki/YAML#Basic_components_of_YAML
        - http://docs.repoze.org/configuration/index.html

    --- !gvim
    mode: tabbed
    open:
        - gspaces/__init__.py
        - setup.py
        - gspaces.yml

    --- !screen
    windows:
        - title: gspaces 
          cmd: python manage.py runserver

Obviously, it prepares your workspace and opens some stuff for you. I also plan to add "shutdown"
support. I will release it under BSD licence and hope somebody else will find it useful.


