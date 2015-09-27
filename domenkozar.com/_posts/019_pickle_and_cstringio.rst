---
categories: english, python, oss
author: Domen Kožar
date: 2010/01/19 15:15:18
title: "pickle and cStringIO"
draft: false
---
More of a note to myself: 

You just cannot (I guess because of lacking proper pickling C API support) pickle cStringIO.StringIO
instances. Use StringIO.StringIO instead.


