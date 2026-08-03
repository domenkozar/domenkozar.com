Build
-------

::

    $ devenv shell
    $ build


Preview
-------

::

    $ devenv shell
    $ serve

The local site is available at http://localhost:1313/.


Cloudflare Pages
----------------

Configure Cloudflare Pages with:

::

    Build command: ./build.sh
    Build output directory: public
    HUGO_VERSION: 0.164.0

The build requires the Cloudflare v3 build image and no ``PYTHON_VERSION=2.7``
override.
