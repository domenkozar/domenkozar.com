---
categories: english, python, strings
author: Domen Kožar
date: 2009/06/11 12:58:00
title: "Joining strings in Python"
draft: false
---
There is already a lot of `good <http://www.skymind.com/~ocrow/python_string/>`_ `material
<http://wiki.python.org/moin/PythonSpeed/PerformanceTips>`_ to read about performance. Therefore, 
it is best to use the following method:


.. sourcecode:: python

    >>> print ' '.join(['The', 'fox', 'jumped', 'over', 'the', 'dog.'])
        The fox jumped over the dog.

Perfect. We have very fast string contatenation that even allows us to choose separator. Now, here
is the problem:


.. sourcecode:: python

    >>> print ', '.join(['apples', 'oranges', '', 'cocos'])
        apples, oranges, , cocos

So, if we dynamically generate string and we have a separator for a reason, we do not want this to
happen. This is basically the idea:



.. sourcecode:: python

    >>> print ', '.join(filter(None, ['apples', 'oranges', '', 'cocos']))
        apples, oranges, cocos

As you can see, filter(None, iterable) returns list of elements that evalue to True. This way we
have somewhat a safe string contatenation. Real world example:


.. sourcecode:: python

    class StringBuffer:

    	def __init__(self, sep=''):
    		self.sep = sep
    		self.output = list()

    	def write(self, content):
    		self.output.extend(content)

    	def getvalue(self):
    		return self.sep.join(filter(None, self.output))


    >>> sb = StringBuffer(', ')
    >>> sb.write(['apples'])
    >>> sb.write(['', None])
    >>> sb.write(['oranges', 'cocos'])
    >>> print sb.getvalue()
    apples, oranges, cocos



