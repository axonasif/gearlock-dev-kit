---
Title: Integrate / Customize GearLock
Description: GearLock customization guide for users and developers.
Author: AXON
Date: 2020-05-06
Template: index
---

Customizing GearLock at it's best
=================================

GearLock is seriously extensive and customizable. In this page I will try to brief most of the customization options available for GearLock. Which covers the usage of `gearlockrc` and use of `hook` alongside some other miscellaneous customization options.

GEARLOCKRC
----------

[$GHOME][Ghome-Var]/**.gearlockrc** file gets loaded by GearLock core and it contains some of the GearLock settings that you can re-configure. Also, it can be used to overwite any of the core variables or functions of GearLock. This customization file can be also used to handle `hook`.

> Here is the preview of default `gearlockrc` file.

> Note: It can be outdated here, better check on your local version.

> Most of the common options in this file can be also configured through `GearLock Ui > Settings`.

```bash
##### GearLock Configuration File
### This configuration file is loaded by GearLock core.
### And is also used by all other sub gearlock applications during their runtime.
### This configuration file gets modified when you change `Settings` through Gearock Ui.
### You can override any CORE variable or function through this configuration file. (Do not modify unless you want to change the defaults)
### Please check `https://supreme-gamers.com/gearlock/customize-integrate-gearlock` to learn more.



## Boot Sound
# You can specify your own bootsound in wav format.
# Remove/Empty/put-something-else in this variable if you want to disable bootsound.
BOOTSOUND="/gearlock/etc/bootsound.wav"

## Update Check
# GearLock periodically checks for update
# You can either set this variable to `no` or remove it.
UPDATE_CHECK="yes"

## Secondary TTY
# GearLock spawns a secondary tty that you get on pressing `ALT+F8`
# You can disable it if you like by either setting to `no` or removing it.
SECOND_GTTY="yes"

## Default GearLock Interface Theme
# Since you know that GearLock currently comes with two themes, so you might wanna set a default
# The current theme keycoddes are: `metro`, `classic`
DEFAULT_THEME="notset"


# # ## Below I'm referencing some sensitive configurations that you can change.
# # ## It is not recommended to modify these unless you know what you're doing.
# # ## Remove all `# #` to modify.
# # 
# # 
# # ## GRROOT_DIR
# # # This is the mountpoint folder where your OS-PARTITION is mounted.
# # GRROOT_DIR="/gearlock/gearroot"
# # 
# # ## GRROOT
# # # GROOT is the place where files like `ramdisk.img` & `initrd.img` exist.
# # # It is basically nedded in cases when your android-x86 distro is installed under a subdirectory in your OS-PARTITION.
# # # GearLock auto detects the correct path, do not override this unless necessary.
# # GRROOT="$GRROOT_DIR/example-folder"
# # 
# # ## GHOME
# # # ghome is the place where GearLock store a lot of things for it's work process.
# # # GBDIR, DEPDIR, STATDIR, UNINSDIR etc. are depended on this variable.
# # GHOME="/system/ghome"
# # 
# # ## Host Processor Architecture
# # HOST_ARCH="x86_64"
# # 
# # ## Android version
# # ANDROID_VER="7.1"
# # 
# # ## HOOKDIR
# # # This is the directory path for hooking files inside GearLock core.
# # HOOKDIR="$GHOME/hook"
# # 
# # ## HOOK_DEL_FILES
# # # If you want to delete core file/folder before GearLock load files from your $HOOK_DIR
# # HOOK_DEL_FILES=(
# # "/gearlock/core/src.main/10"
# # "/gearlock/core/help"
# # )
```


GHOME
-----

Read about $GHOME at [Environment-Variables][Ghome-Var] page. If you're a developer and want to pre-define some settings and stuff then you can have your custom `ghome` dir as `/system/ghome`.


HOOK
----

If you're a developer and willing to integrage GearLock in your android-x86 build then `hook` can be useful to you. GearLockUi default menu structure and most of the sub-elements of GearLock is **dynamic** and can be modified/extended easily. If you look at `/gearlock/core` and try to understand then it could be more clear to you.

The concept of `hook` is pretty simple. It is mainly there to merge everything from [$GHOME][Ghome-Var]/**hook**/* into `/gearlock/`.
So that you can modify core files of gearlock without having to touch the actual core.

You can also make the use of `HOOK_DEL_FILES` in `gearlockrc` to delete any file within `/gearlock/*` before GearLockUi runtime and loading hook.


#### Here is a messy tutorial about changing or adding a new item in `GearLock Main-Menu`

So let's say you want to add your own menu item in `GearLock Main-Menu`.

But there is one problem you got, if you directly extract the `gearlock` cpio image which gets loded on each boot to modify the menu-structure then that's not reliable since your modifications will get lost on any future GearLock updates that the user will receieve. And everything inside `hook` dir gets replaced with the actual GearLock core before the Ui runtime.

And for that you can do the following:

* Now if you look at `/gearlock/core/main.src` and `/gearlock/core/main.src/_lang_/_menu_en` you will realize these are what responsible for the GearLock Ui Main-Menu. It mainly calls the other sub-menus at `/gearlock/core/*src` and executes them as required.

* Make a directory named `hook` at [$GHOME][Ghome-Var] and then it'd be [$GHOME][Ghome-Var]/**hook**

* Now if you wanna add a new menu element at the main-menu there are two things that you will need to replace/add.
> For example, they could be:
> `/gearlock/core/main.src/_lang_/_menu_en` (Menu file with your new menu item record at end of line) && `/gearlock/core/main.src/X` (Your item executable)

* Now what you need to do in your `hook` dir is, make another dir called `core` inside your `hook` dir. In the same way make other chid directories while replicating the actual `/gearlock/core/*` structure depending on your neeeds. After that place the corresponding files that you want to get replaced before GearLockUi runs.


Building GearLock inside AOSP-x86 source
----------------------------------------

If you are compiling android-x86 from source and want to include GearLock with your builds then you can use this external repository containing patches for the aosp-x86 source.

```
https://github.com/AXIM0S/bootable_gearlock
```


Although, you could also boot into your OS and use the `gearlock-installer` executable and then pack up the patched `initrd.img` and `gearlock(cpio image)`. Then modify `install.img/scripts/0-install` to copy `gearlock` image during installation.







[Ghome-Var]: https://supreme-gamers.com/gearlock/environment-variables#ghome
