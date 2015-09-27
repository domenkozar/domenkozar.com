---
categories: english, 
author: Domen Kožar
date: 2010/03/11 16:19:00
title: "Redmine and mercurial-server"
draft: false
---
I managed to put together Redmine as issuetracker/wiki/younameit and mercurial-server which manages
multi-user access to mercurial repository through ssh. 

Redmine installation: **redmine:redmine /var/lib/redmine/** 

Mercurial-server installation: **hg:hg /home/hg/** 

I have put redmine into group hg. 


The issue
~~~~~~~~~

When you add repository lets say /home/hg/vim/ to redmine, it does not recognise it. Not until you
ofcourse make repository read/writeable for hg group (chmod 760). Now comes punchline; $HOME
directory must be executable in order for Redmine to read repository info. In my case, I had to do
"chmod 710 /home/hg/" in order to redmine to work.

Note that if you change write permissions to home user in linux, pubic keys ssh authentication will
not work anymore for security reasons.


