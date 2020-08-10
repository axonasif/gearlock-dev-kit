---
Title: GearBoot Documentation
Description: Hook into boot with GearBoot
Author: AXON
Date: 2020-05-05
Template: index
---

GearBoot
========

Introduction
------------

GearBoot is a very simple program which can run executables during boot dynamically.<br>
GearBoot supports four different boot stages.

- init
- post-fs
- post-fs-data
- boot-post
- boot-comp

GearBoot is very lightweight and superfast. It assigns each of the executables with a unique PID.

The logfile is `/gearlock/tmp/gearboot.log`

During GearBoot runtime `PATH` variable is set to:

```
/gearlock/bin:/sbin:/bin:/system/bin:/system/xbin:/system/vendor/bin
```

If **GearLock** came pre-installed in your system then gearboot dir can be found at `/system/ghome`<br>
If it was a manual installation then it should be at `/data/ghome`

For most developers `boot-comp` stage should be fine and shouldn't mess with other stages unless you know what you're doing!

**Use the [custom-core][custom-core-pkg] package to work with gearboot scripts**

Boot-Stage Defination
---------------------

To be honest, the first three stages ( `post-fs` `post-fs-data` and `boot-post` ) are passed real quick but there are some key changes in between.

Below I will try to explain what and how each of the gearboot stages that matter.

init
----

This is basically valid before you see the early console-tty blinking after grub has loaded your kernel and is about to switch on the secondary-ramdisk. In this stage android-system won't be running or active. Not a good idea to think of hooking into it unless you know what you're doing.

post-fs
-------

There are actually a few more *early stages before `post-fs` to be completed when android-x86 switches to the secondary ramdisk. Now you might be wondering why don't we just hook those stages also ?

In simple words, it's literally unnecessary and not really a good thing to do. Even hacking into something over the `post-fs` stage also seems quite rare though.

As much I can understand, this stage can be marked when you get to see the OS hostname blinking in the early tty screen (command line). This is also two steps before you see the bootanimation to be appearing.

post-fs-data
-------------

This is obviously after `post-fs` stage. During this stage, `build.prop` and most of the system modules are already loaded.
The bootanimation comes after this stage.

boot-post
---------

This is the beginning of bootanimation and is valid till android-x86 enter the graphical interface.

boot-comp
---------

This is after bootanimation then you see something like `Android is loading...` in graphical interface.<br>
To be noted that this is basically the final stage and no more stages are to come after this.<br>
For most cases it's suggested to target this stage for your executable.


Write GearBoot logfile
----------------------

`gearboot.log` is present in `/gearlock/tmp` which holds the records of what executables were run during each boot-stage. So if you want to write something over your executable name in the log then you can use `write_gblog` in your gearboot-executable.


So, let's say `my-cool-program3` was your gearboot-executable and then `gearboot.log` was like

```
# Start of boot-post stage @ Wed XYZ
  123456:12:44  :  boot-post  :  my-cool-program
  123456:12:45  :  boot-post  :  my-cool-program2
  

# Start of boot-comp stage @ Wed XYZ
  123456:12:47  :  boot-comp  :  my-cool-program3
  123456:12:48  :  boot-comp  :  my-cool-program4
```

Now, if you do this in `my-cool-program3` (bash):

```bash
write_gblog "Opps, something wrong"
```

`gearboot.log` will be like:

```
# Start of boot-post stage @ Wed XYZ
  123456:12:44  :  boot-post  :  my-cool-program
  123456:12:45  :  boot-post  :  my-cool-program2
  

# Start of boot-comp stage @ Wed XYZ
  123456:12:47  :  boot-comp  :  my-cool-program3 : Opps, something wrong
  123456:12:48  :  boot-comp  :  my-cool-program4
```


Manual trigger
--------------

If you want to re-execute the boot executables without rebooting as a user then you can do it easily. (Not recommended)

From `gearboot --help`

```
Usage:   gearboot <boot-stage>

Example: gearboot s2 # For executing post-fs-data executables

<Boot-Stages>

    s1 : post-fs
    s2 : post-fs-data
    s3 : boot-post
    s4 : boot-comp
```

### Also check

+ [GearProp][GearProp] can be useful while changing props during boot
+ Check **[GearBoot Executables][GearBoot-Executables]** section in [GetStarted][GetStarted] page
+ Take a look at [environment variables][Env-Vars]
+ Must check out [GearLock Utilities][GearLock-Dev-Utils]

[GetStarted]: https://supreme-gamers.com/gearlock
[custom-core-pkg]: https://supreme-gamers.com/gearlock/#custom-core-package
[GearLock-Utils]: https://supreme-gamers.com/gearlock/gearlock-dev-utils
[Env-Vars]: https://supreme-gamers.com/gearlock/environment-variables
[GearProp]: https://supreme-gamers.com/gearlock/gearlock-dev-utils#gearprop
[GearBoot-Executables]: https://supreme-gamers.com/gearlock/#gearboot-executables
