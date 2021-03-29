#!/gearlock/bin/bash
## For proper developer documentation, visit https://wiki.supreme-gamers.com/gearlock/developer-guide

# If you want to supply an executable which can operate whithin gearlock for users then you should do it here.
# This file is initially a bash script but it could be anything that's executable. And this file's extension `.sh` doesn't matter.
# You can rename the `.sh` extension as your needs, or have no file extension if you want and GearLock would still detect that during installation.

# Once someone install your package/extension, they will be able to execute this `extension` through `GearLock > Extensions`
# You must delete this if you dont need it. Also note that you don't need to manually deal with this file, GearLock will take care of it

# Example
geco "Hello, this extension script was executed inside gearlock..."
