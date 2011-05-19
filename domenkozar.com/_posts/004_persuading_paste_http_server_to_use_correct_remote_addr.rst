---
categories: english, python, nginx, paste
author: Domen Kožar
date: 2009/06/26 22:58:00
title: "Persuading Paste HTTP server to use correct REMOTE_ADDR"
draft: false
slug: persuading-paste-http-server-to-use-correct-remote-addr
---
Configuring reverse proxy headers was on bottom of my TODO list because I never felt it was
important for my applications. Today I tried to fuddle with nginx to pass those headers but it gave
me a headache.

For sake of reference and because I'm sure many others tripped on this one, here is what I figured
out from mailing lists and source code (please inform me of a better, straight forward way if there
is one):

Add to your deployment.ini file:


.. sourcecode:: ini

    [app:main]
    # ...
    filter-with = proxy-headers

    [filter:proxy-headers]
    use = egg:PasteDeploy#prefix

Prefix middleware actually extracts proxy headers information and passes results forward. Now, nginx
config:


.. sourcecode:: nginx

    location / {
            proxy_pass http://localhost:5000;

            proxy_set_header X_FORWARDED_SERVER $server_name;
            proxy_set_header X_FORWARDED_FOR $proxy_add_x_forwarded_for;
            proxy_set_header X_FORWARDED_HOST $proxy_host;

        }


