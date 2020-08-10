---
Title: GearLock User Utils
Description: Useful GearLock utilities for daily use.
Author: AXON
Date: 2020-05-03
Template: index
---

GearLock User Utils !
====================

Introduction
------------

GearLock brings a number of addional command-line utils alongside dev-utils which are useful as a daily user. These include `sudo` re-implementation for android-x86 and so on.


GXPM
----

**GXPM** is the command-line interface of GearLock-Package&Extension-Manager. This can come handly in many purposes.

* To install something `gsudo gxpm -i /path/to/package`
* To uninstall something `gsudo gxpm -u` and it will list all the installed things for you to pick to uninstall.
* To list everything installed `gsudo gxpm -l`

Note: Run `gxpm --help` to get all these instructions on the command-line.

GSUDO
------

**GSUDO** is a re-implementation concept of `sudo` for android-x86 allowing you to run things as `root:root` user while being a different user on terminal emulators on android-x86.

The android_x86 tty actions are done over the `root:shell` usergroup.
Which causes some executable binaries to be working in a wrong manner even while it's still the root user partially.

For example,
+ If you try to extract any .7z archive with p7zip then you will notice that the source permissions of the archive wasnt preserved.
+ The same happens with most other executable binaries also, such as cpio, gzip etc.

Gsudo alter the default su for running commands as root while perserving the current environment and uses bash.
So, you can use gsudo without leaving the current shell just like any `sudo` that you find on **unix** distros.
Gsudo acts within the `root:root` usergroup rather than `root:shell`.

Usage: `gsudo <any-regular-command>`

Example: `gsudo mkdir /data/new`


FIXSCREEN
----------

**FIXSCREEN** can help to readjust terminal to fit full-screen when you run `su` shell and your terminal gets kinda small and messy. Just simply run `fixscreen` command and it should do it's job.

GSTATUS
--------

**GSTATUS** is specially made to gather almost all the essential android-x86 operating system information in one place. This is the same thing when you use `Status` option in GearLock UI. Simply run `gsudo gstatus` on the command-line to make it work outside of GearLock UI.

GEARLOCK-CLI
------------

**GEARLOCK-CLI** is the command line version of `GearLock Ui` to manually run any specific `/gearlock/core` function that you get to see in `GearLock Menu` outside of GearLock in an interactive way.

Examples:

* `gsudo gearlock-cli settings`
* `gsudo gearlock-cli updater`
* `gsudo gearlock-cli main.src/3`
* `gsudo gearlock-cli emisc.src/1`


GFE (Experimental)
------------------

**GFE** stands for _GearLock-File-Explorer_, it's not complete in any way. It was just quickly programmed for fun purposes. Although, you can browse across your file-system and open files to modify with `nano`.
Run `gfe` on command-line to use it.

Bonus Tips
----------

There are more command-line linux utils packed within GearLock.
Some of them are `7z`, `nano`, `top`, `wget`, `curl` and more.
You can use these for things like extracting archives(7z), editing files(nano), viewing resource usage(top), downloading files(wget,curl) and more.