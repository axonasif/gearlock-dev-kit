GearLock Utils !
=============

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
Then you have to use the `-f` option in `gearprop`

Let's assume you have a text file named `myprops.sh`

**Then you can do:**

```
gearprop -f myprops.sh
```

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

gsudo
-----

This is something which you really don't need to care about, you should only care about it as a user and you don't need to use it **inside** GearLock since GearLock runs as `root:root` ug by default.

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
if [ $? = 0 ]; then

    geco "Yay, you're connected with the internet ...!"
    
    # Do something
    
else

    geco "Sorry, I can't work without internet connection :("
    exit 0

fi
```

check_compat
------------

If you want to check whether the host user is running a GearLock version which might not be compatible with your package/extension then you can call `check_compat` function.

Usage: `check_compat <minimum-terget-version>`

Example:

```
check_compat 6.0
```

Let's say the user is running `GearLock 5.9`, thus it will return `1` as the return-code and an additional variable as `COMPAT=no`.

While if the user is running `GearLock 6.0` or higher version it will return `0` and `COMPAT=yes`

linux utils
------------

Take a look at `/gearlock/bin` to know about all the linux utils which are available for use!


```bash
ls /gearlock/bin

 2to3                      choom           e2scrub          ftpput         i2cdetect   losetup        mountpoint         print              sed                 tabs           unlzma
 2to3-3.8                  chown           e2scrub_all      fuser          i2cdump     ls             mpstat             printf             selinuxenabled      tac            unlzop
 7z                        chpst           e2undo           g              i2cget      lsattr         mv                 prlimit            sendmail            tail           unshare
 7za                       chroot          e4crypt          garc           i2cset      lscpu          mypid              ps                 seq                 tar            unxz
'['                        chrt            echo             garca          i386        lsipc          namei              pscan              seq,                taskset        unzip
'[['                       chvt            ed               gawk           iconv       lsmod          nameif             pstree             sestatus            tc             updatedb
 acpi                      ckdirex         egrep            gawk-5.0.1     id          lsof           nanddump           ptx                setarch             tcpsvd         uptime
 acpid                     cksum           eject            gbash          idle        lspci          nandwrite          push               setconsole          tee            usleep
 add-trusted-certificate   clear           env              gbjob          idle3       lsscsi         nano               pv                 setenforce          telnet         uudecode
 addpart                   cmp             ether-wake       gbjob.enc      idle3.8     lsusb          nbd-client         pwcat              setfattr            telnetd        uuencode
 adjtimex                  col             expand           gclone         ifconfig    lzcat          nc                 pwd                setfont             test           uuidgen
 apropos                   colcrt          expr             gdbm_dump      ifdown      lzcmp          ncursesw6-config   pwdx               setkeycodes         tftp           vconfig
 ar                        colrm           factor           gdbm_load      ifenslave   lzdiff         netcat             pydoc              setlogcons          tftpd          vdir
 arch                      column          fakeidentd       gdbmtool       ifplugd     lzegrep        netstat            pydoc3             setpgid             tic            vi
 arp                       comm            fallocate        gdload         ifup        lzfgrep        newc.fs            pydoc3.8           setpriv             time           vmstat
 arping                    compile_et      false            gearboot       inetd       lzgrep         newc.fs.enc        python             setserial           timeout        volname
 ascii                     conspy          fatattr          gearboot.enc   infocmp     lzless         nice               python-config      setsid              toe            watch
 ash                       coreutils       fbset            gearinit       infotocap   lzma           nl                 python3            setterm             top            watchdog
 awk                       count           fbsplash         gearinit.enc   inotifyd    lzmadec        nmeter             python3-config     setuidgid           touch          wc
 b2sum                     cp              fdflags          gearlock       insmod      lzmainfo       nohup              python3.8          sh                  toybox         wdctl
 badblocks                 cpio            fdflush          gearlock.enc   install     lzmore         nologin            python3.8-config   sha1sum             tput           wget
 base                      crc32           fdformat         gearprop       ionice      lzop           nout               raidautorun        sha224sum           tr             whatis
 base32                    crond           fdisk            gearprop.enc   iorenice    lzopcat        nproc              rdate              sha256sum           traceroute     whereis
 base64                    crontab         fetch            gearrec        iostat      make_ext4fs    nsenter            rdev               sha384sum           traceroute6    which
 basename                  csplit          fetch.enc        gearrec.enc    iotop       makedevs       nslookup           readahead          sha3sum             tree           whiptail
 basenc                    ctrlaltdel      fgconsole        gecca          ip          makemime       nsnake             readlink           sha512sum           true           whoami
 bash                      cttyhack        fgrep            geco           ipaddr      makewhatis     nuke               readprofile        showfigfonts        truec          whois
 bashbug                   curl            figlet           gecpc          ipcalc      man            numfmt             realpath           showkey             truec.enc      wipefs
 bbconfig                  curl-config     figlist          getconf        ipcrm       mandoc         od                 reboot             shred               truefalse      xargs
 bc                        cut             file             getenforce     ipcs        matchpathcon   oneit              reformime          shuf                truncate       xxd
 beep                      date            filefrag         getopt         iplink      mcookie        openssl            remountfs          slattach            ts             xz
 blkdiscard                dc              fincore          gfe            ipneigh     md5sum         openvt             remountfs.enc      sleep               tset           xzcat
 blkid                     dd              find             gfe.enc        iproute     mesg,          pacman             rename             smemcap             tsort          xzcmp
 blkzone                   deallocvt       findfs           gink           iprule      microcom       pacmanedit         renice             sntp                tty            xzdec
 blockdev                  debugfs         finfo            gkillapp       iptunnel    mix            partprobe          reset              soelim              ttysize        xzdiff
 brctl                     delpart         fixextfs         gkillapp.enc   isosize     mk_cmds        partx              resize             softlimit           tunctl         xzegrep
 bunzip2                   demandoc        fixextfs.enc     grcat          join        mkbootimg      passwd             resize2fs          sort                tune2fs        xzfgrep
 busybox                   depmod          fixscreen        grep           kbd_mode    mkdir          paste              resizepart         split               ubiattach      xzgrep
 busybox.alt               devmem          flash_eraseall   groups         kill        mkdosfs        patch              restorecon         sqlite3             ubidetach      xzless
 bzcat                     df              flash_lock       gsdir          killall     mke2fs         patchelf           resume             ssl_client          ubimkvol       xzmore
 bzcmp                     dhcprelay       flash_unlock     gsdir.enc      killall5    mkfifo         pathchk            rev                start-stop-daemon   ubirename      yes
 bzdiff                    dialog          flock            gslr           klogd       mkfs           pcre-config        rfkill             stat                ubirmvol       zcat
 bzgrep                    diff            fmt              gslr.enc       ldattach    mkfs.bfs       pcre2-config       rm                 stdbuf              ubirsvol       zcip
 bzip2                     dir             fold             gsudo          less        mkfs.cramfs    pcre2grep          rmdir              strftime            ubiupdatevol   zcmp
 bzip2recover              dircolors       frcode           gsudo.enc      lessecho    mkfs.ext2      pcre2test          rmmod              strings             udhcpc         zdiff
 bzless                    dirname         free             gunzip         lesskey     mkfs.ext3      pcregrep           rmt                stty                udhcpc6        zegrep
 bzmore                    dmesg           freeramdisk      gzexe          link        mkfs.ext4      pcretest           rnano              sudo                udhcpd         zfgrep
 c_rehash                  dnsd            fsck             gzip           linux32     mkfs.minix     pgrep              route              sum                 udpsvd         zforce
 cal                       dnsdomainname   fsck.cramfs      hardlink       linux64     mkfs.reiser    pidof              rsync              sv                  uevent         zgrep
 captoinfo                 dos2unix        fsck.ext2        hd             ln          mkfs.vfat      ping               rtcwake            svc                 ul             zless
 cat                       du              fsck.ext3        hdparm         loadfont    mklost+found   ping6              run-init           svlogd              ulimit         zmore
 catv                      dumpe2fs        fsck.ext4        head           loadkmap    mknod          pipe_progress      run-parts          svok                umount         znew
 chat                      dumpkmap        fsck.minix       help           locate      mkpasswd       pivot_root         runcon             swaplabel           uname          zramctl
 chattr                    dumpleases      fsfreeze         hexdump        logger      mkswap         pkill              runsv              swapoff             uname26
 chcon                     e2freefrag      fstrim           hexedit        login       mktemp         pmap               runsvdir           swapon              uncompress
 chcpu                     e2fsck          fstype           hostname       logname     modinfo        popmaildir         rx                 switch_root         unexpand
 chgrp                     e2image         fsync            httpd          logread     moon-buggy     poweroff           script             sync                uniq
 chkfont                   e2label         ftpd             hush           logsave     more           powertop           scriptlive         sysctl              unix2dos
 chmod                     e2mmpstatus     ftpget           hwclock        look        mount          pr                 scriptreplay       syslogd             unlink
```

**Protip:** Run `bash` in terminal and feel the real power ;) Say goodbye to `sh` !
