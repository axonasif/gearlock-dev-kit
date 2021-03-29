## For proper developer documentation, visit https://wiki.supreme-gamers.com/gearlock/developer-guide

# You need to have basic knowledge about scripting in bash.
# You can also code in python if you know python since GearLock brings python with it.
#
# GearLock also provides some easy to use functions which can be helpful while scripting.
# Check out the online documentation for more information.

# For configuring your package, check `!zygote.sh` or GDK can also guide you during the build process.
# To configure your installation script, check `install.sh`
# If you want to provide some custom uninstallation functions alongside `gearlock-autogen-unins-script` then do it inside `uninstall.sh`

# If you want to use boot-executables then go check `gearlock/gerboot` dir
# If you want to push an extension executable which can run inside `GearLock > Extensions` then check `gearlock/extension.sh`

# There is a common dir for GearLock which is `dependencies`, you can also put any additional files if you'd like GearLock to auto-copy them.
# `dependencies` dir path can be called through `$DEPDIR` var.
# Note: Since gearlock 7.2.7, you can create/use `gearlock/ghome/dependencies` as well but I'd still prefer `gearlock/dependencies`
# 		Both of the placements results in same installation location ($DEPDIR)

# You can put things at `gearlock/ghome/.local` dir, for example: `gearlock/ghome/.local/bin/something` (I hope that explains the rest of `.local` dir)
# FYI, `$GHOME/.local/bin` is added in PATH by GearLock
