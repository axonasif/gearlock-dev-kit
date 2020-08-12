---
Title: GearLock Dev Utils
Description: Get idea about using the gearlock utils.
Author: AXON
Date: 2020-05-02
Template: index
---

GearLock Dev Utils !
====================

Introduction
------------

GearLock brings a wide range of prebuild linux utils that you may find in a well-known linux distro nowadays. You get things like `bash`, `python` and so on! There are also some additional build-in functions which can ease your scripting work. Lets start with the basics. (bash specific)

geco
----

`geco` is limited to GearLock only, which means that you can only use it **inside** GearLock.<br>
You can use `geco` to print anything on the terminal with color/underline/blink option.


- Normal output Example:
```
geco "Hello, you printed this message with geco"
```

Note: You must quote `" "` your message if it contains any special characters or spaces.

### geco color output
---------------------

- Syntax
```
geco "${COLOR-CODE}Some text${RC}"
```

- Example:
```
geco "${YELLOW}Hello${RC}, you printed this message with geco"
```

#### Color codes for geco

| Basic | Bold | Underline |
|--|--|--|
| ${RC} | | |
| ${RED} | ${BRED} | ${URED} |
| ${GREEN} | ${BGREEN} | ${UGREEN} |
| ${BLUE} | ${BBLUE} | ${UBLUE} |
| ${CYAN} | ${BCYAN} | ${UCYAN} |
| ${PURPLE} | ${BPULPLE} | ${UPURPLE} |
| ${YELLOW} | | ${UYELLOW} |
| ${WHITE} | | ${UWHITE} |
| | | ${UBLACK} |
| ${GRAY} | | |
| ${ORANGE} | | |

Note: Here `${RC}` is used to reset the color to normal.<br>Otherwise your whole terminal screen would get messed up!

### geco extensions
--------------------

#### gecca
---------

`gecca` can print the output from a text file into the middle of your terminal screen.

Example:

```
gecca yo.txt
```

Output:

```
                                 _                
                                | |__   ___ _   _ 
                                | '_ \ / _ \ | | |
                                | | | |  __/ |_| |
                                |_| |_|\___|\__, |
                                            |___/ 

```
#### gecpc
---------

`gecpc` can print a line with full width of your screen

Example:

```
gecpc "In the middle" "+"
```

Output:
```
+++++++++++++++++++++++++++++++++ In the middle +++++++++++++++++++++++++++++++++
```


#### gecprog
-------------

`gecprog` Can be used to print a animated working progress.

Usage: 

```bash
(your-commands-here) & gecprog "Progress Text to print before the animated meter"
```

### Advanced geco usage
-----------------------

If linux is your daily driver then you should be obviously fimiliar with the things that I'm about to show you.

Geco always prints with a partly hidden `\n` newline character.
It might be a bit hard to notice it but it actually works like that.

For example:

```
geco "Hello, world!"
```

Output:

```
Hello, world!


```

For a live practice, try this and see for yourself: 
```
clear; geco "Hello, world!"; sleep 10
```

<br>
#### Excluding newline from geco
--------------------------------

If you want to do something trickiy then you can exclude the newline.

For example:

```
geco "Hello, world!\c"
```

Output:

`Hello, world!`

To make the concept clear with a more practical example:

```
geco "This file does not exist \c"; rm /baloo
```
Which gives:
```
This file does not exist rm: cannot remove '/baloo': No such file or directory
```

While if you do (without `\c` character at the end of you message)

```
geco "This file does not exist "; rm /baloo
```

Then:

```
This file does not exist 
rm: cannot remove '/baloo': No such file or directory
```

Notice the `\c`, it's used at the end of your message to avoid making a newline `\n` character.

<br>
#### Including extra newlines
--------------------------

Just in the way you exclude the hidden `\n` newline with `\c`, it's just doing the opposite.<br>Which is, you include it!

Example:

```
geco "Here I am\n"
```

Output:

```
Here I am



```

Notice that it has two extra newlines instead of one. (1 by default + 1 because of an extra `/n` char)

You can include as many newlines you like.

```
geco "Here I am\n\n\n"
```

```
Here I am






```

**geco alternatives:** `echo`  `printf`


figlet
------

**figlet** can print real-time ascii art from text. If you've used this on a typical linux distro then you might already know what this is.

- With default font: `figlet <text>`

Example: `figlet Hey`

```
                                 _                
                                | |__   ___ _   _ 
                                | '_ \ / _ \ | | |
                                | | | |  __/ |_| |
                                |_| |_|\___|\__, |
                                            |___/ 

```

- With a custom font: `figlet -f <font-name> <text>`

Example: `figlet -f graffiti GearLock`

```
              ________                    .____                  __    
             /  _____/  ____ _____ _______|    |    ____   ____ |  | __
            /   \  ____/ __ \\__  \\_  __ \    |   /  _ \_/ ___\|  |/ /
            \    \_\  \  ___/ / __ \|  | \/    |__(  <_> )  \___|    < 
             \______  /\___  >____  /__|  |_______ \____/ \___  >__|_ \
                    \/     \/     \/              \/          \/     \/

```

**Available fonts:** `banner` `big` `block` `bubble` `digital` `graffiti` `hex` `ivrit` `lean` `mini` `mnemonic` `script` `shadow` `slant` `small` `smscript` `smshadow` `smslant` `standard` (default) `term`

nout
----

`nout` comes with GearLock which can make it easy for you to silence almost any command.

For example, lets say that you want to delete a file but you don't want to have any error output for that if any error occours.

So, if you do something like:

`rm /system/wackadua`

And then `rm` gives the output:

`rm: cannot remove '/system/wackadua': No such file or directory`

Which if you want to silent then you can:

`nout rm /system/wackadua`

Output:

```
```

As you can see, no output came out but the command was surely done.
Although you should always test out each of the command that you silence to be sure that it actually ran instead of doing nothing.

gclone
------

For doing the copy-paste job easily over file & folders you get to use gclone and you must use it! gclone is initially rsync and it's just here to make it a bit more quicker to do the thing while showing a human friendly progress bar.

- With progress indicator
`gclone /source /terget`

Example: `gclone /system/priv-app/GmsCore /sdcard/Downloads`

- Without progress indicator
`gclone -q /source /terget`

Example: `gclone -q /system/build.prop /data/adb`

You can also use `rsync` for advanced use since gearlock brings pretty much all the native linux utils that you may find in a well-known linux distro nowadays.

**gclone alternatives:** `cp` `rsync` `cat` `mv`

gkillapp
--------

gkillapp can easily stop a running android app with the package-id.

- Syntax

`gkillapp <package-id>`

- Example

```
gkillapp com.google.vending
```

Note: If the app is not running then gkillapp will print an error message.

gslr
----

`GearLock search line and replace` (gslr) can scan a readable file for a word or line and replace the result with the specified text.

Usage: `gslr <terget-file> <text-to-search> <the-text-to-replace-result>`

Example: 
```
gslr /system/foo "Hello world!" "Yo, you got me!"
```

Note: Gslr only takes the first line which was found as the result and will return an error if not found.

**gslr alternatives:** `sed` `awk`

gearprop
--------

`gearprop` can help when you need to modify multiple system props.<br>
It also got the capability to force overwrite any kind of property. (Bypassing `setprop` limitations)
There are two ways you can acheive this, which are:

- Through a variable
- From a readable text file

#### Through a variable
------------------------

Define your props inside a var in `<prop> <value>` format.<br>
Which obviously is supposed to be called from a script.

**An example:** (from `gearprop --help`)
```
# Define your props inside a var in <prop> <value> format
my_var="
dalvik.vm.heapmaxfree 8m
net.bt.name Android
dalvik.vm.stack-trace-file /data/anr/traces.txt
"

# Now call the var over gearprop with quotes
gearprop "$my_var"
```

Note: You must always use quotes `" "` while calling your variable.

#### From a readable text file
------------------------------

This is also pretty simple and straightforward.<br>
Just like the variable method, define your props in `<prop> <value>` format in your text file.<br>

Let's assume you have a text file named `myprops.txt`

**Then you can do:**

```
gearprop myprops.txt
```

Extra notes: You can define your props in `<prop>=<value>` format also but thats deprecieated.
Also, you can specify multiple variable or files together. GearProp initially passess all the processed data to `gearprop-helper` and it does the rest.

**gearprop alternative:** `setprop`

gearhost
--------

GearHost can be used to reroute static ip's with the same implementation as in `/system/etc/hosts` but dynamically.

The usage is same as `gearprop`.

Try `gearhost --help` in the command line to learn more.

ckdirex
-------

`ckdirex` checks whether if the specified folder exist, if not then it makes that folder with an optional permission.

- Syntax

```
ckdirex <folder-path> <optional-permission>
```

- Example (with optional-permission)

```
ckdirex /system/new 755
```

- Example (without specifying any permission)

```
ckdirex /system/new
```


garc
----

`garc` is basically a fork of 7z. You can use it to extract almost any archive.

Note: `garc` comes with additional `zstd` support.

- Basic Syntax

```
garc x -o<output-location> -p<optional-password> <acheive-name>
```

- Example

```
garc x -o"/data/media" /system/my-archive.zip
```

- All functions

```
Usage: garc <command> <switches> <archive_name>

<Commands>
  a : Add files to archive
  b : Benchmark
  d : Delete files from archive
  e : Extract files from archive (without using directory names)
  h : Calculate hash values for files
  i : Show information about supported formats
  l : List contents of archive
  rn : Rename files in archive
  t : Test integrity of archive
  u : Update files to archive
  x : eXtract files with full paths

<Switches>
  -- : Stop switches parsing
  -ai[r[-|0]]{@listfile|!wildcard} : Include archives
  -ax[r[-|0]]{@listfile|!wildcard} : eXclude archives
  -ao{a|s|t|u} : set Overwrite mode
  -an : disable archive_name field
  -bb[0-3] : set output log level
  -bd : disable progress indicator
  -bs{o|e|p}{0|1|2} : set output stream for output/error/progress line
  -bt : show execution time statistics
  -i[r[-|0]]{@listfile|!wildcard} : Include filenames
  -m{Parameters} : set compression Method
    -mmt[N] : set number of CPU threads
  -o{Directory} : set Output directory
  -p{Password} : set Password
  -r[-|0] : Recurse subdirectories
  -sa{a|e|s} : set Archive name mode
  -scc{UTF-8|WIN|DOS} : set charset for for console input/output
  -scs{UTF-8|UTF-16LE|UTF-16BE|WIN|DOS|{id}} : set charset for list files
  -scrc[CRC32|CRC64|SHA1|SHA256|*] : set hash function for x, e, h commands
  -sdel : delete files after compression
  -seml[.] : send archive by email
  -sfx[{name}] : Create SFX archive
  -si[{name}] : read data from stdin
  -slp : set Large Pages mode
  -slt : show technical information for l (List) command
  -snh : store hard links as links
  -snl : store symbolic links as links
  -sni : store NT security information
  -sns[-] : store NTFS alternate streams
  -so : write data to stdout
  -spd : disable wildcard matching for file names
  -spe : eliminate duplication of root folder for extract command
  -spf : use fully qualified file paths
  -ssc[-] : set sensitive case mode
  -ssw : compress shared files
  -stl : set archive timestamp from the most recently modified file
  -stm{HexMask} : set CPU thread affinity mask (hexadecimal number)
  -stx{Type} : exclude archive type
  -t{Type} : Set type of archive
  -u[-][p#][q#][r#][x#][y#][z#][!newArchiveName] : Update options
  -v{Size}[b|k|m|g] : Create volumes
  -w[{path}] : assign Work directory. Empty path means a temporary directory
  -x[r[-|0]]{@listfile|!wildcard} : eXclude filenames
  -y : assume Yes on all queries

```

**garc alternatives:** `7z` `tar` `gzip` `bzip2` `cpio` `zcat` `zip`


get_base_dir
------------

Warning! This is a GearLock-Only function. You can not use it outside GearLock.

When you call the function `get_base_dir` from a script,<br>it return's the base directory path from where that script is being executed in `$BD` variable.

**Hint:** This function is implemented on the `install.sh` of both `core` & `prebuild-kernel` package.

get_net_stat
------------

Warning! This is a GearLock-Only function. You can not use it outside GearLock.

When you call the function `get_net_stat` from a script

- While the host system is connected with internet

`NET_CONN=yes` and return code is `0`

- While the host system is not connected with internet

`NET_CONN=no` and return code is `1`

Example script for practice:

```
# Call get_net_stat function
get_net_stat

# Now perform action on condition (a simple example, can be done in many ways)
if [ "$NET_CONN" = "yes" ]; then

    geco "Yay, you're connected with the internet ...!"
    
    # Do something
    
else

    geco "Sorry, I can't work without internet connection :("
    exit 1

fi
```

check_compat
------------

If you want to check whether the host user is running a GearLock version which might not be compatible with your package/extension then you can call `check_compat` function.

Usage: `check_compat <minimum-terget-version>`

Example:

```
check_compat 6.4
```

Let's say the user is running `GearLock 6.1`, thus it will return `1` as the return-code and an additional variable as `COMPAT=no`.

While if the user is running `GearLock 6.1` or higher version it will return `0` and `COMPAT=yes`

linux utils
------------

Take a look at `/gearlock/bin` to know about all the linux utils which are available for use!


```bash
ls /gearlock/bin

 2to3                      cp              fsck.ext2           hexedit     lzmore             pcre2test          setsid              umount
 2to3-3.8                  cpio            fsck.ext3           hostname    lzop               pcregrep           setterm             uname
 7z                        crc32           fsck.ext4           httpd       lzopcat            pcretest           setuidgid           uname26
 7za                       crond           fsck.minix          hwclock     make_ext4fs        pgrep              sh                  uncompress
'['                        crontab         fsfreeze            i2cdetect   makemime           pidof              sha1sum             unexpand
'[['                       csplit          fstrim              i2cdump     makewhatis         ping               sha224sum           uniq
 acpi                      ctrlaltdel      fstype              i2cget      man                pipe_progress      sha256sum           unix2dos
 add-trusted-certificate   curl            fsync               i2cset      mandoc             pivot_root         sha384sum           unlink
 addpart                   curl-config     ftpd                i386        mcookie            pkill              sha3sum             unlzma
 apropos                   cut             ftpget              iconv       md5sum             pmap               sha512sum           unlzop
 ar                        date            ftpput              id          mix                popmaildir         showfigfonts        unpackbootimg
 arch                      dc              funzip              idle        mk_cmds            pr                 shred               unshare
 arp                       dd              fuser               idle3       mkbootimg          print              shuf                unxz
 arping                    debugfs         g                   idle3.8     mkdir              printenv           sleep               unzip
 ascii                     delpart         garc                ifconfig    mkdosfs            printf             smemcap             unzipsfx
 ash                       demandoc        garca               infocmp     mke2fs             prlimit            sntp                unzstd
 awk                       depmod          gawk                infotocap   mkfifo             ps                 soelim              updatedb
 b2sum                     dialog          gawk-5.0.1          inotifyd    mkfs               pscan              softlimit           uptime
 badblocks                 diff            gbash               insmod      mkfs.bfs           pstree             sort                usleep
 base                      dir             gclone              install     mkfs.cramfs        ptx                split               uudecode
 base32                    dircolors       gdbm_dump           ionice      mkfs.ext2          push               sqlite3             uuencode
 base64                    dirname         gdbm_load           iorenice    mkfs.ext3          pv                 start-stop-daemon   uuidgen
 basename                  dmesg           gdbmtool            iostat      mkfs.ext4          pwcat              stat                vconfig
 basenc                    dnsdomainname   gdload              iotop       mkfs.minix         pwd                stdbuf              vdir
 bash                      dos2unix        gearboot            ip          mkfs.vfat          pwdx               strftime            vi
 bashbox                   du              gearboot.enc        ipaddr      mklost+found       pydoc              strings             vmstat
 bashbug                   dumpe2fs        gearhost            ipcalc      mknod              pydoc3             stty                watch
 bbconfig                  e2freefrag      gearhost.enc        iplink      mkpasswd           pydoc3.8           sudo                wc
 bc                        e2fsck          gearinit            ipneigh     mkrecovery         python             sum                 wdctl
 blkdiscard                e2image         gearinit.enc        iproute     mkrecovery.enc     python-config      sv                  wget
 blkid                     e2label         gearlock            iprule      mkrecovery.multi   python3            svlogd              whatis
 blkzone                   e2mmpstatus     gearlock-cli        iptunnel    mkswap             python3-config     swaplabel           whereis
 blockdev                  e2scrub         gearlock-cli.enc    isosize     mktemp             python3.8          swapoff             which
 brctl                     e2scrub_all     gearlock-post       join        modinfo            python3.8-config   swapon              whiptail
 bunzip2                   e2undo          gearlock-post.enc   kill        moon-buggy         rdate              switch_root         whoami
 busybox                   e4crypt         gearlock.enc        killall     more               readahead          sync                whois
 bzcat                     echo            gearprop            killall5    mount              readlink           sysctl              wipefs
 bzcmp                     ed              gearprop-helper     ldattach    mountpoint         readprofile        tabs                xargs
 bzdiff                    egrep           gearprop.enc        less        mpstat             realpath           tac                 xxd
 bzgrep                    env             gearrec             lessecho    mv                 reboot             tail                xz
 bzip2                     envdir          gearrec.enc         lesskey     mypid              reformime          tar                 xzcat
 bzip2recover              expand          gecca               link        namei              remountfs          taskset             xzcmp
 bzless                    expr            geco                linux32     nano               remountfs.enc      tc                  xzdec
 bzmore                    factor          gecpc               linux64     nc                 rename             tcpsvd              xzdiff
 c_rehash                  fallocate       getconf             ln          ncursesw6-config   renice             tee                 xzegrep
 cal                       false           getopt              loadfont    neofetch           reset              telnet              xzfgrep
 captoinfo                 fdflags         gfe                 locate      netcat             resize             telnetd             xzgrep
 cat                       fdisk           gfe.enc             logger      netstat            resize2fs          test                xzless
 catv                      fetch           gink                login       nice               resizepart         tftp                xzmore
 chattr                    fetch.enc       gkillapp            logname     nl                 rev                tftpd               yes
 chcon                     fetch.in        gkillapp.enc        logsave     nmeter             rfkill             tic                 zcat
 chcpu                     fetch.in.enc    grcat               look        nohup              rm                 time                zcmp
 chgrp                     fgconsole       grep                losetup     nout               rmdir              timeout             zdiff
 chkfont                   fgrep           groups              ls          nproc              rmmod              toe                 zegrep
 chmod                     figlet          gsdir               lsattr      nsenter            rmt                top                 zfgrep
 choom                     figlist         gsdir.enc           lscpu       nsnake             rnano              touch               zforce
 chown                     file            gslr                lsipc       numfmt             route              toybox              zgrep
 chpst                     filefrag        gslr.enc            lsmod       od                 rsync              tput                zip
 chroot                    fincore         gstatus             lsof        oneit              rtcwake            tr                  zipcloak
 chrt                      find            gstatus.enc         lspci       openssl            run-parts          traceroute          zipgrep
 chvt                      findfs          gsudo               lsscsi      openvt             runcon             tree                zipinfo
 ckdirex                   finfo           gsudo.enc           lsusb       pacman             runsv              true                zipnote
 cksum                     fixextfs        gunzip              lzcat       pacmanedit         runsvdir           truefalse           zipsplit
 clear                     fixextfs.enc    gxpm                lzcmp       parted             rx                 truncate            zless
 cmp                       fixscreen       gxpm.enc            lzdiff      partx              script             tset                zmore
 col                       fixscreen.enc   gzexe               lzegrep     passwd             scriptlive         tsort               znew
 colcrt                    flock           gzip                lzfgrep     paste              scriptreplay       tty                 zramctl
 colrm                     fmt             halt                lzgrep      patch              sed                ttysize             zstd
 column                    fold            hardlink            lzip        patchelf           sendmail           tunctl              zstdcat
 comm                      frcode          hd                  lzless      pathchk            seq                tune2fs             zstdgrep
 compile_et                free            head                lzma        pcre-config        setarch            udpsvd              zstdless
 coreutils                 fsck            help                lzmadec     pcre2-config       setfont            ul                  zstdmt
 count                     fsck.cramfs     hexdump             lzmainfo    pcre2grep          setpgid            ulimit
```

**Protip:** Run `bash` in terminal and feel the real power ;) Say goodbye to `sh` !