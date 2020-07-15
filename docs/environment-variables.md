Environment Variables
=====================

Introduction
------------

The GearLock environment variables can be used to access some common data.
You must keep in mind that these are only useable during GearLock or GearBoot runtime.

Variables
---------

*Global ones are available on both GearLock & GearBoot

| Global | GearLock Only | GearBoot only |
|--|--|--|
| GRROOT |  | GBRUNTIME |
| GTMP |  |  |
| ANDROID_VER |  |  |
| SDK |  |  |  |
| YEAR |  |  |
| DATE |  |  |
| DEPDIR |  |  |
| STATDIR |  |  |
| GRROOT_DIR |  |  |
| GRLOAD |  |  |
| GBDIR |  |  |
| GHOME |  |  |
| RECOVERY | IT |  |
| HOST_ARCH |  |  |
| BOOTCOMP |  |  |
| KERNEL_IMAGE |  |  |

GRROOT_DIR
----------

This is the place where GearBoot mounts the `android-x86` OS partition.

On calling this var it will return `/gearlock/gearroot`

GRROOT
------

This is the place where the actual `android-x86` OS files exist.

By this I mean the place where you find files like `initrd.img` `ramdisk.img` `kernel`

GearBoot searches for the `kernel` file in `$GRROOT_DIR` to determine this var, this is done in cases when the OS files are present in a separate folder in the partition.

On calling this var it will return the directory path where the actual OS files exist.

HOST_ARCH
---------

On calling this var it returns either `x86` or `x86_64`

ANDROID_VER
-----------

Return's android version code, like 7.1/8.0/9.0 ++

**Note:** It's based on `ro.build.version.sdk`

SDK
----

Return's the SDK version code.

GBRUNTIME
---------

The value of this var is set to `yes` when `GearBoot` is running during boot.

Example:

```
echo $GBRUNTIME
```

Output: `yes`

DATE
-----

Returns current date.

YEAR
----

Returns current year.

GHOME
------

`ghome` is the place where GearLock stores extensions, gearboot scripts, common dependencie directory, status log files.

If gearlock came pre-installed into your system then `$GHOME` path is `/system/ghome`<br>
While if it was a manual installation then `$GHOME` path is `/data/ghome`

Other vars depended on `$GHOME` >

- `DEPDIR=$GHOME/dependencies`
- `STATDIR=$GHOME/status`
- `GBDIR=$GHOME/gearboot`


GTMP
----

`$GTMP` path is `/gearlock/tmp`

This place is temporary and gets cleaned up on boot.<br>

Only use this for storing small temp files if you want to use this place.

GRLDIR
------

Returns the path for `gearload` directory


RECOVERY
--------

When the user is running **GearLock** in early **Recovery** mode this is set to **yes**.

IT
---

The interface which is being used. From either classic or metro.

BOOTCOMP
--------

Is `yes` or not empty once the OS has completely landed on GUI.

KERNEL_IMAGE
------------

Full accessible path to currently booted kernel image.
