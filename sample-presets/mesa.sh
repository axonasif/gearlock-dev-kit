## For proper develoer documentation, visit https://supreme-gamers.com/gearlock

# Check `zygote.sh` to configure your package functions or gearlock can also guide you during the build process

#####--- Import Functions ---#####
get_base_dir # Returns the directory path in $BD variable from where this *install.sh is being executed
#####--- Import Functions ---#####

geco "\n${GREEN}Cleaning up existing mesa deps and dri${RC}"

# nout is used to silence the output

#llvm
nout rm -r /system/lib/libLLVM*
nout rm -r /system/lib64/libLLVM*
#dri
nout rm -r /system/lib/dri
nout rm -r /system/lib64/dri
nout rm -r /system/vendor/lib/dri
nout rm -r /system/vendor/lib64/dri
nout rm -r /system/phoenixos_darkmatter/dri
nout rm -r /system/phoenixos_darkmatter64/dri
#hw
nout rm -r /system/lib/hw/*
nout rm -r /system/lib64/hw/*
nout rm -r /system/vendor/lib/hw/*
nout rm -r /system/vendor/lib64/hw/*
#dnout rm
nout rm -r /system/lib/libdnout rm_*
nout rm -r /system/lib/libdnout rm.so
nout rm -r /system/lib64/libdnout rm_*
nout rm -r /system/lib64/libdnout rm.so
nout rm -r /system/vendor/lib/libdnout rm_*
nout rm -r /system/vendor/lib/libdnout rm.so
nout rm -r /system/vendor/lib64/libdnout rm_*
nout rm -r /system/vendor/lib64/libdnout rm.so
#gralloc_dnout rm
nout rm -r /system/lib/libgralloc_dnout rm.so
nout rm -r /system/lib64/libgralloc_dnout rm.so
nout rm -r /system/vendor/lib/libgralloc_dnout rm.so
nout rm -r /system/vendor/lib64/libgralloc_dnout rm.so
#gbm
nout rm -r /system/lib/libgbm.so
nout rm -r /system/lib64/libgbm.so
nout rm -r /system/vendor/lib/libgbm.so
nout rm -r /system/vendor/lib64/libgbm.so
#glapi
nout rm -r /system/lib/libglapi.so
nout rm -r /system/lib64/libglapi.so
nout rm -r /system/vendor/lib/libglapi.so
nout rm -r /system/vendor/lib64/libglapi.so
#libGLESmesa
nout rm -r /system/lib/egl/libGLES_mesa.so
nout rm -r /system/lib64/egl/libGLES_mesa.so
nout rm -r /system/vendor/lib/egl/libGLES_mesa.so
nout rm -r /system/vendor/lib64/egl/libGLES_mesa.so
#GLES-CM_EGL-orig
nout rm -r /system/lib/libEGL_orig.so
nout rm -r /system/lib/libGLESv1_CM_orig.so
nout rm -r /system/lib/libGLESv2_orig.so
nout rm -r /system/lib/libGLESv3_orig.so
nout rm -r /system/lib64/libEGL_orig.so
nout rm -r /system/lib64/libGLESv1_CM_orig.so
nout rm -r /system/lib64/libGLESv2_orig.so
nout rm -r /system/lib64/libGLESv3_orig.so

geco "\n+ Merging mesa dri & dependencie files in your operating-system"
gclone "$BD/system" / # You must use quotes " " if any of your file-name contains *spaces or special characters


## There are many more awesome functions that you can use, visit https://supreme-gamers.com/gearlock for more infonout rmation.
