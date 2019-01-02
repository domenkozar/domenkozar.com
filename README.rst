Install
-------

::

    $ git clone https://github.com/domenkozar/domenkozar.com.git
    $ virtualenv --no-site-packages .
    $ . bin/activate
    $ pip install -r requirements.txt

Generate static site
--------------------

::

    blogofile build -s domenkozar.com

Deploy
------

::

    rsync -avz --delete domenkozar.com/_site/ www@static.domenkozar.com:/var/www/www.domenkozar.com/


Generate pygments.css
---------------------

::

    pygmentize -f html -S monokai -a .highlight > pygments.css
