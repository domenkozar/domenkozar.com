Build
-------

::

    $ nix-build


Generate pygments.css
---------------------

::

    pygmentize -f html -S monokai -a .highlight > pygments.css
