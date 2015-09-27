---
categories: english, security
author: Domen Kožar
date: 2012/06/18 21:00:00
title: "Cryptography class by Coursea: post-mortem"
draft: true
---

Following `Machine Learning <https://www.coursera.org/course/ml>`_  and `Artificial Intelligence <https://www.ai-class.com/>`_ classes I attended in 2011, I have decided to participate in `Cryptography <https://www.coursera.org/course/crypto>`_ class, also taught by Stanford professor. Following is a short review of important information I have learned during 6 weeks (can't wait for part two of Crypto class!).

**Never, ever implement your own crypto.** Important lesson that developers learn the hard way. There are quite some crpyto libraries in the wild, usually bindings exists for the language in question. During the course **Dan Boneh** illustrates multiple times that if there exists software that should be reused and not be rewritten, it's crypto.

**Timing attacks.** Beautiful example why not to implement your own crypto.
- explanation
- examples of mistakes
- solution
- web timing attacks.

**Confident understanding of crypto is needed in order to use crypto primitives correctly.**

**Always be up to date with what standards are broken.**

**Smallest mistake can lead into informatin leakage**


- sha1 is theoretically broken, matter of time for practical attack
- use PBKDF2 when storing passwords (or bcrypt/scrypt)
- (3)DES is mostly history, use AES with a 128bit or higher key

**Secure connection needs way more than just data encryption, that's why standards as TLS/SLL were invented**


**If you ever have to implement authentication ...., then use one of the standards**


**Don't leak information about errors**.

**RSA key generation with bad entropy (routers, etc.)**

**SSL/TLS fuckup**
