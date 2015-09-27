---
categories: english, windows, python, install
author: Domen Kožar
date: 2009/09/27 13:53:00
title: "Writing post-installation-script to create shortcut on Windows desktop"
draft: false
---
I'm building an GUI program that will be used on Windows platform. I already accepted the fact that
I will need three installers (Python, GTK stuff, and one for my package). 

Now, I want my installer to place shiny little shortcut on my desktop. Here is the command to
generate Window installer:

.. sourcecode:: bash

    python setup.py egg_info -RDb "" bdist_wininst --install-script postinstall.py

**egg_info -RDb** will clear and developemnt tags from release name, so the output will be
*package-0.1* instead of *package-0.1dev*

**bdist_wininst** will invoke Windows Installer builder

**--install-script postinstall.py** commands that postinstall.py script mentioned in *setup.py* file
will be used for post installation. 

Here is the *setup.py* slice. Note that this script must lie in root of our package:

.. sourcecode:: python

    ...
    setup(name='package',
          ...
          scripts=['postinstall.py'],
          ...
          )

And finally, the postinstall.py:


.. sourcecode:: python

    #! python
    # -*- coding: utf-8 -*-

    import os
    import sys
    import shutil
    import my_package

    DESKTOP_FOLDER = get_special_folder_path("CSIDL_DESKTOPDIRECTORY")
    NAME = 'program.lnk'

    if sys.argv[1] == '-install':
        create_shortcut(
            os.path.join(sys.prefix, 'pythonw.exe'), # program
            'Description of the shortcut', # description
            NAME, # filename
            mypackage.__file__, # parameters
            '', # workdir
            os.path.join(os.path.dirname(my_package.__file__), 'favicon.ico'), # iconpath
        )
        # move shortcut from current directory to DESKTOP_FOLDER
        shutil.move(os.path.join(os.getcwd(), NAME),
                    os.path.join(DESKTOP_FOLDER, NAME))
        # tell windows installer that we created another 
        # file which should be deleted on uninstallation
        file_created(os.path.join(DESKTOP_FOLDER, NAME))

    if sys.argv[1] == '-remove':
        pass
        # This will be run on uninstallation. Nothing to do.


[1] Note that I'm using some custom builtin functions, you can read more about `here
<http://docs.python.org/distutils/builtdist.html?highlight=create_shortcut#the-postinstallation-script>`_.

[2] I'm invoking pythonw.exe instead of python.exe because I don't want console to be visible (we
are using GUI, remember).

[3] In __init__.py of the my_package, use the casual __name__ == '__main__' trick.


