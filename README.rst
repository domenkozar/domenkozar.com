Install
-------

::

    $ git clone https://github.com/iElectric/domenkozar.com.git
    $ virtualenv --no-site-packages .
    $ activate bin/source
    $ pip install blogofile

Generate static site
--------------------

::

    blogofile build -s domenkozar.com

Deploy
------

::

    rsync -avz --delete site.com/_site/ www-data@server:/var/www/www.site.com/


Generate pygments.css
---------------------

::

    pygmentize -f html -S monokai -a .highlight > pygments.css
