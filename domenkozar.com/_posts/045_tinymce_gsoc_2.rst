---
categories: english, tinymce, plone, python
author: Domen Kožar
date: 2011/07/11 23:55:52
title: "GSOC #2: TinyMCE improvements for Plone"
draft: false
---

`University <http://www.fe.uni-lj.si/>`_ was quite successfully killing my overall productivity. Past week was grand finale, so I'm completely back to `TinyMCE <http://tinymce.moxiecode.com/>`_ and `Plone <http://plone.org/>`_.

For few past weeks I was working on upgrading TinyMCE to version `3.4.3 <http://tinymce.moxiecode.com/develop/changelog/index.php?ctrl=version&act=view&pr_id=1&vr_id=368>`_ (Plone currently uses version back from 2009). Fully automated upgrade procedure is now as easy as running a shell script. Upgrade was twice (or more) as painful as I originally anticipated. During upgrade many walls were hit and I questioned the whole approach. The conclusion is more or less: this is not maintainable. Few thoughts:

* we maintain separate branch from TinyMCE guys and make changes directly into the core -- correct approach would be to merge important changes upstream and keep our plugins separate (although this is near to impossible with current TinyMCE architecture)
* **every Plone change to TinyMCE should be commented (explained atleast briefly) and noted where it starts and ends**
* I created github `fork <https://github.com/collective/tinymce>`_ of TinyMCE to keep merging easier. It will brings a little bit painful development, but that can be solved.

Mockups for browser dialog are finished! I'm quite satistifed with the result: `screenshots <http://yukaii.com/data/plone-tinymce/>`_. Following things were kept in mind while redesigning the interface, to keep it more inituitive:

    * elaborate icons
    * separate shortcuts and link types (also add explicit "internal" link intead of clicking "home")
    * more clear idea that "current folder" is a place where uploaded file will land
    * image thumbnails
    * less fragments of window to make it less confusing
    * few new features like external image upload

Until the midterm evaluations (15. July) I will try to get new design converted into HTML/CSS ready for backend changes and merge upgraded TinyMCE to github. Would *love* to hear comments on redesign, what can be further improved?

| *PS: Without Vim as my "battle with text" ultimate tool, the job would be a suicide.*
| *PPS: I'm participating at Sauna Sprint 2011, which will be an important week for the project, you should join while there is space left ;)*
| *PPPS: Thanks for all the ideas around improvements, I will prioritize report what's being worked on!*

