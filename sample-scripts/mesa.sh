## For proper develoer documentation, visit https://supreme-gamers.com/gearlock

# Check `zygote.sh` to configure your package functions or gearlock can also guide you during the build process

#####--- Import Functions ---#####
get_base_dir # Returns the directory path in $BD variable from where this *install.sh is being executed
#####--- Import Functions ---#####

clean_job(){
#llvm
rm -r /system/lib/libLLVM*
rm -r /system/lib64/libLLVM*
#dri
rm -r /system/lib/dri
rm -r /system/lib64/dri
rm -r /system/vendor/lib/dri
rm -r /system/vendor/lib64/dri
rm -r /system/phoenixos_darkmatter/dri
rm -r /system/phoenixos_darkmatter64/dri
#hw
rm -r /system/lib/hw/*
rm -r /system/lib64/hw/*
rm -r /system/vendor/lib/hw/*
rm -r /system/vendor/lib64/hw/*
#drm
rm -r /system/lib/libdrm_*
rm -r /system/lib/libdrm.so
rm -r /system/lib64/libdrm_*
rm -r /system/lib64/libdrm.so
rm -r /system/vendor/lib/libdrm_*
rm -r /system/vendor/lib/libdrm.so
rm -r /system/vendor/lib64/libdrm_*
rm -r /system/vendor/lib64/libdrm.so
#gralloc_drm
rm -r /system/lib/libgralloc_drm.so
rm -r /system/lib64/libgralloc_drm.so
rm -r /system/vendor/lib/libgralloc_drm.so
rm -r /system/vendor/lib64/libgralloc_drm.so
#gbm
rm -r /system/lib/libgbm.so
rm -r /system/lib64/libgbm.so
rm -r /system/vendor/lib/libgbm.so
rm -r /system/vendor/lib64/libgbm.so
#glapi
rm -r /system/lib/libglapi.so
rm -r /system/lib64/libglapi.so
rm -r /system/vendor/lib/libglapi.so
rm -r /system/vendor/lib64/libglapi.so
#libGLESmesa
rm -r /system/lib/egl/libGLES_mesa.so
rm -r /system/lib64/egl/libGLES_mesa.so
rm -r /system/vendor/lib/egl/libGLES_mesa.so
rm -r /system/vendor/lib64/egl/libGLES_mesa.so
#GLES-CM_EGL-orig
rm -r /system/lib/libEGL_orig.so
rm -r /system/lib/libGLESv1_CM_orig.so
rm -r /system/lib/libGLESv2_orig.so
rm -r /system/lib/libGLESv3_orig.so
rm -r /system/lib64/libEGL_orig.so
rm -r /system/lib64/libGLESv1_CM_orig.so
rm -r /system/lib64/libGLESv2_orig.so
rm -r /system/lib64/libGLESv3_orig.so
}

geco "\n${GREEN}Cleaning up existing mesa deps and dri${RC}"; nout clean_job

geco "\n+ Merging mesa dri & dependencie files in your operating-system"
gclone "$BD/system" / # You must use quotes " " if any of your file-name contains *spaces or special characters


## There are many more awesome functions that you can use, visit https://supreme-gamers.com/gearlock for more information.
