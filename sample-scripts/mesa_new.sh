## For proper develoer documentation, visit https://supreme-gamers.com/gearlock

# Check `zygote.sh` to configure your package functions or gearlock can also guide you during the build process

#####--- Import Functions ---#####
get_base_dir # Returns the directory path in $BD variable from where this *install.sh is being executed
#####--- Import Functions ---#####


clean_job(){
rm -r /system/lib/libdrm.so \
/system/lib/libdrm_amdgpu.so \
/system/lib/libdrm_nouveau.so \
/system/lib/libdrm_intel.so \
/system/lib/libdrm_radeon.so \
/system/lib/libgralloc_drm.so \
/system/lib/egl/libGLES_mesa.so \
/system/lib/libhardware* \
/system/lib/libLLVM80.so \
/system/lib/libglapi.so \
/system/lib/libgbm.so \
/system/lib64/libdrm.so \
/system/lib64/libdrm_amdgpu.so \
/system/lib64/libdrm_nouveau.so \
/system/lib64/libdrm_intel.so \
/system/lib64/libdrm_radeon.so \
/system/lib64/libhardware* \
/system/lib64/libLLVM80.so \
/system/lib64/libGLES_mesa.so \
/system/lib64/libglapi.so \
/system/lib64/libgralloc_drm.so \
/system/vendor/lib/libglapi.so \
/system/vendor/lib/hw/vulkan* \
/system/vendor/lib/egl/libGLES_mesa.so \
/system/vendor/lib64/libglapi.so \
/system/vendor/lib64/hw/vulkan* \
/system/vendor/lib64/egl/libGLES_mesa.so \
/system/lib64/libgbm.so \
/system/ghome/status/mesav > /dev/null 2>&1

rm -rf /system/lib/dri \
/system/lib64/dri \
/system/vendor/lib/dri \
system/vendor/lib64/dri /dev/null 2>&1
}


geco "\n+ Checking if you have backed up some important files ..."; sleep 1
geco "\n+ Replace these files if you have glitchy and broken graphics ..."; sleep 1
if [ -d /data/media/0/drmbackup ]; then
geco "\n+ You have backed up the files, so no need to backup anymore"
else
geco "\n+ You haven't back up those yet, let me do it ..."
#creating folders
# ckdirex checks whether if the dir exists and if not then makes it with an *optional permisson.
ckdirex /data/media/0/drmbackup 755
ckdirex /data/media/0/drmbackup/lib 755
ckdirex /data/media/0/drmbackup/lib/hw 755
ckdirex /data/media/0/drmbackup/lib64 755
ckdirex /data/media/0/drmbackup/lib64/hw 755
ckdirex /data/media/0/drmbackup/vendor 755
ckdirex /data/media/0/drmbackup/vendor/lib 755
ckdirex /data/media/0/drmbackup/vendor/lib64 755
#moving files
mv /system/lib/libEGL.so \
/system/lib/libGLESv1_CM.so \
/system/lib/libGLESv2.so /data/media/0/drmbackup/lib

mv /system/lib/hw/gralloc.default.so \
/system/lib/hw/gralloc.drm.so \
/system/lib/hw/hwcomposer.drm.so /data/media/0/drmbackup/lib/hw

mv /system/lib64/libEGL.so \
/system/lib64/libGLESv1_CM.so \
/system/lib64/libGLESv2.so /data/media/0/drmbackup/lib64

mv /system/lib64/hw/gralloc.default.so \
/system/lib64/hw/gralloc.drm.so \
/system/lib64/hw/hwcomposer.drm.so mkdir /data/media/0/drmbackup/lib64/hw

mv /system/vendor/lib/libgbm.so /data/media/0/drmbackup/vendor/lib
mv /system/vendor/lib64/libgbm.so /data/media/0/drmbackup/vendor/lib64

fi

geco "\n+ ${GREEN}Cleaning up existing mesa deps and dri${RC}"

# nout is used to suppress the command output
nout clean_job

geco "+ Merging mesa dri & dependencie files in your operating-system"
gclone "$BD/system" / # You must use quotes " " if any of your file-name contains *spaces or special characters
geco "\n+ Updated Mesa status on Gearlock"

## There are many more awesome functions that you can use, visit https://supreme-gamers.com/gearlock for more information.
