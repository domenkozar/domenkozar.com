---
categories: english, python packaging setuptools distutils
author: Domen Kožar
date: 2010/07/07 17:04:00
title: "Hidden gem in Python packaging world"
draft: false
---
Packaging love-hate world in Python is with every Python developer. Each time you need something
from setuptools/distribute/distutils you actually find something new, useful. Can not deny that.
There are quite some people working hard on distutils2 to remove the "miserable" word from
packaging. I'm really hoping that lack of communication with Python developers and Linux
distribution will be fixed when people will not only care, but also give constructive thoughts how
distutils could be improved (and thus make life easier even to Linux distributions).

Enough of non-sense philosophy. Recently I found about "Feature" class in setuptools/distribute.
Let's see what setuptools has to say about "features" keyword passed to the famous setup function:

::

    'features' -- a dictionary mapping option names to 'setuptools.Feature'
            objects.  Features are a portion of the distribution that can be
            included or excluded based on user options, inter-feature dependencies,  
            and availability on the current system.  Excluded features are omitted
            from all setup commands, including source and binary distributions, so
            you can create multiple distributions from the same source tree.
            Feature names should be valid Python identifiers, except that they may
            contain the '-' (minus) sign.  Features can be included or excluded
            via the command line options '--with-X' and '--without-X', where 'X' is
            the name of the feature.  Whether a feature is included by default, and 
            whether you are allowed to control this from the command line, is  
            determined by the Feature object.  See the 'Feature' class for more                                                                                  
            information.

Basically, you can do optional handling what should be installed when user executes "python setup.py
--with-something install"

According to `nullege <http://nullege.com/codes/search/setuptools.Feature/import/page:1>`_,
documentation for Feature class is the following:


::

    A subset of the distribution that can be excluded if unneeded/wanted

    Features are created using these keyword arguments:

      'description' -- a short, human readable description of the feature, to
         be used in error messages, and option help messages.

      'standard' -- if true, the feature is included by default if it is
         available on the current system.  Otherwise, the feature is only
         included if requested via a command line '--with-X' option, or if
         another included feature requires it.  The default setting is 'False'.

      'available' -- if true, the feature is available for installation on the
         current system.  The default setting is 'True'.

      'optional' -- if true, the feature's inclusion can be controlled from the
         command line, using the '--with-X' or '--without-X' options.  If
         false, the feature's inclusion status is determined automatically,
         based on 'availabile', 'standard', and whether any other feature
         requires it.  The default setting is 'True'.

      'require_features' -- a string or sequence of strings naming features
         that should also be included if this feature is included.  Defaults to
         empty list.  May also contain 'Require' objects that should be
         added/removed from the distribution.

      'remove' -- a string or list of strings naming packages to be removed
         from the distribution if this feature is *not* included.  If the
         feature *is* included, this argument is ignored.  This argument exists
         to support removing features that "crosscut" a distribution, such as
         defining a 'tests' feature that removes all the 'tests' subpackages
         provided by other features.  The default for this argument is an empty
         list.  (Note: the named package(s) or modules must exist in the base
         distribution when the 'setup()' function is initially called.)

      other keywords -- any other keyword arguments are saved, and passed to
         the distribution's 'include()' and 'exclude()' methods when the
         feature is included or excluded, respectively.  So, for example, you
         could pass 'packages=["a","b"]' to cause packages 'a' and 'b' to be
         added or removed from the distribution as appropriate.

    A feature must include at least one 'requires', 'remove', or other
    keyword argument.  Otherwise, it can't affect the distribution in any way.
    Note also that you can subclass 'Feature' to create your own specialized
    feature types that modify the distribution in other ways when included or
    excluded.  See the docstrings for the various methods here for more detail.
    Aside from the methods, the only feature attributes that distributions look
    at are 'description' and 'optional'.

A very good example that abuses "features" is `jinja2's setup.py
<http://dev.pocoo.org/hg/jinja2-main/file/978e52f40de3/setup.py>`_. 


