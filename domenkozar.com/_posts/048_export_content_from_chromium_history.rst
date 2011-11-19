---
categories: english, chromium, export
author: Domen Kožar
date: 2011/11/19 22:30:00
title: "Export content from Chromium History"
draft: false
---

Since http://ietherpad.com is down and I was notified all data was lost, this ruined my day, since I was already planning for past few weeks to write a script that would do daily backups.

There is bright future however. I am migrating to http://titanpad.com, `wrote backup script in advance <https://github.com/iElectric/titanpad-backup-tool>`_, and also managed to get some data from chrome cache.

Here are the steps:

* on linux, figure out which history Index are you interested in: **grep -R ietherpad ~/.chromium/Default/\***
* open it: **sqlite3 ~/.chromium/Default/History\ Index\ 2011-11**
* find your page and retrieve data: **select \* from pages_content where c0url like %ietherpad%**
