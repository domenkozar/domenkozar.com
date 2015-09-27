---
categories: english, gsoc, gpypi2, portage, gentoo, python
author: Domen Kožar
date: 2010/08/22 11:51:00
title: "GSoC 2010 report for gpypi2 under Gentoo Linux"
draft: false
---
`GSoC 2010 <http://code.google.com/soc/>`_ is history, but more and more is going on.

Let me rephrase a bit what was my project over this summer, what does it provide and what will the
future bring.

`gpypi2 <http://docs.fubar.si/gpypi2>`_ has become quite more than it's primary goal, installation
of Python packages has never been easier:

* Create/echo Gentoo Linux `ebuilds <http://en.wikipedia.org/wiki/Ebuild>`_ from `Python Package
  Index <http://pypi.python.org>`_ or from Python source (with help of distutils)
* Install that ebuild with invoking *emerge*
* Create overlay from **all** *working* packages on Python Package Index




Install
-------

Very easy.

.. sourcecode:: console

    $ layman -f -o http://gpo.zugaina.org/lst/gpo-repositories.xml
    $ layman -a iElectric

    ### unmask gpypi2, easiest with autounmask
    $ autounmask -a dev-python/gpypi2-9999

    $ emerge -av gpypi2

*gpypi2 -h* for list of commands. Please report bugs to `BitBucket issue tracker
<http://bitbucket.org/iElectric/g-pypi2/issues?status=new&status=open>`_




Not over yet
------------

My work at Gentoo. `I will be back <http://bugs.gentoo.org/show_bug.cgi?id=333183>`_.

Special thanks to my mentor Jesus "neurogeek" Rivero, without him it would be impossible.

PS: In one week I am releasing gpypi2 0.1 release.


