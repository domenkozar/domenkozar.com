---
categories: english, python, nginx, english
author: Domen Kožar
date: 2009/11/15 14:51:00
title: "Fragmenting one big nginx config"
draft: false
---
Getting lost in all glory of big nginx.conf is not that uncommon. I could not stand it anymore, so I
wrote this little clever script with support of pyparsing module for Python:


.. sourcecode:: python

    from pyparsing import *

    nginx_conf_expr = OneOrMore(Suppress(SkipTo('server' + White())) + originalTextFor(Word('server ') + nestedExpr('{', '}'))).parseWithTabs()
    server_name_expr = (Suppress(SkipTo('server_name' + White()) + Word('server_name') + White()) +  CharsNotIn(' ;')).parseWithTabs()

    nginx_conf = open('nginx.conf').read()
    new_nginx_conf = str(nginx_conf)

    for server in nginx_conf_expr.parseString(nginx_conf):
        try:
            name = server_name_expr.parseString(server)[0]
            f = open('nginxsite_%s.conf' % name, 'w+')
            f.write(str(server))
            f.close()

    	# update nginx config
    	new_nginx_conf = new_nginx_conf.replace(str(server), '')
        except:
            print 'Entry failed:\n', server

    open('new_nginx.conf', 'w').write(new_nginx_conf)

**Warning! Do not use that on production data before making a backup copy! Script has been tested on
~1500 long nginx config, and is not bulletproof** This script basically extracts all server {}
entries and writes them to separate files named "nginxsite_sitename.conf" (all in current working
directory). It also produces new_nginx.conf that does not include extracted entries. All you need to
do is to add include directive to new_nginx.conf like this:

.. sourcecode:: nginx

    # path is relative to this global nginx.conf
      include sites/*.conf;

*Note that I haven't made it very customizable (it should be with little python knowledge).* 

**Example:**


.. sourcecode:: console

    temp $ ls
    migrate_nginx_config.py
    nginx.conf

    temp $ python migrate_nginx_config.py
    migrate_nginx_config.py
    nginx.conf
    new_nginx.conf
    nginxsite_www.fubar.si.conf
    nginxsite www.tvnext.si.conf
    ...


