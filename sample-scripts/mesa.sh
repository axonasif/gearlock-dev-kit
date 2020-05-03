#+++++++++ This sample script is not ready yet. Need to refine it a bit more


## If you're thinking of using this then you should probably know what you're upto.
## It is necessary to clean up all the existing mesa deps before installing a new one to avoid conflicts.
## Make sure to include all the mesa deps that you find to be cleaned up in `clean_job` function.
## For proper develoer documentation, visit https://supreme-gamers.com/gearlock
## Any contibutions to this sample script is welcome.

# Check `zygote.sh` to configure your package functions or gearlock can also guide you during the build process

#####--- Import Functions ---#####
get_base_dir # Returns the directory path in $BD variable from where this *install.sh is being executed
#####--- Import Functions ---#####


# Define functions
clean_job(){
	#llvm
	rm \
		/system/lib/libLLVM* \
		/system/lib64/libLLVM* \
		/system/lib/vendor/libLLVM* \
		/system/lib64/vendor/libLLVM* \
		#dri
	rm -r \
		/system/lib/dri \
		/system/lib64/dri \
		/system/vendor/lib/dri \
		/system/vendor/lib64/dri \
		/system/phoenixos_darkmatter/dri \
		/system/phoenixos_darkmatter64/dri \
		#hw
	rm \
		/system/lib/hw/* \
		/system/lib64/hw/* \
		/system/vendor/lib/hw/* \
		/system/vendor/lib64/hw/* \
		# vulkan
	rm \
		/system/lib/*vulkan* \
		/system/lib64/*vulkan* \
		/system/lib/hw/*vulkan* \
		/system/lib64/hw/*vulkan* \
		/system/vendor/lib/*vulkan* \
		/system/vendor/lib64/*vulkan* \
		/system/vendor/lib/hw/*vulkan* \
		/system/vendor/lib64/hw/*vulkan*
	#drm
	rm \
		/system/lib/libdrm_* \
		/system/lib/libdrm.so \
		/system/lib64/libdrm_* \
		/system/lib64/libdrm.so \
		/system/vendor/lib/libdrm_* \
		/system/vendor/lib/libdrm.so \
		/system/vendor/lib64/libdrm_* \
		/system/vendor/lib64/libdrm.so
	#gralloc_drm
	rm \
		/system/lib/libgralloc_drm.so \
		/system/lib64/libgralloc_drm.so \
		/system/vendor/lib/libgralloc_drm.so \
		/system/vendor/lib64/libgralloc_drm.so
	#gbm
	rm \
		/system/lib/libgbm.so \
		/system/lib64/libgbm.so \
		/system/vendor/lib/libgbm.so \
		/system/vendor/lib64/libgbm.so
	#glapi
	rm \
		/system/lib/libglapi.so \
		/system/lib64/libglapi.so \
		/system/vendor/lib/libglapi.so \
		/system/vendor/lib64/libglapi.so
	#libGLESmesa
	rm \
		/system/lib/egl/libGLES_mesa.so \
		/system/lib64/egl/libGLES_mesa.so \
		/system/vendor/lib/egl/libGLES_mesa.so \
		/system/vendor/lib64/egl/libGLES_mesa.so
	#GLES-CM_EGL-orig
	rm \
		/system/lib/libEGL_orig.so \
		/system/lib/libGLESv1_CM_orig.so \
		/system/lib/libGLESv2_orig.so \
		/system/lib/libGLESv3_orig.so \
		/system/lib64/libEGL_orig.so \
		/system/lib64/libGLESv1_CM_orig.so \
		/system/lib64/libGLESv2_orig.so \
		/system/lib64/libGLESv3_orig.so
}


# Since building a mesa library which would work on any android version is quite impossible
# Thus you must verify the host system android version. An example is given below (variable ref: https://supreme-gamers.com/gearlock/environment-variables)

# # if [ ! $ANDROID_VER = 7 ] || [ ! $ANDROID_VER = 7.1 ]; then
# #
# # geco "\n+ You can not install this mesa build in android-${ANDROID_VER}"
# #
# # exit 101 #(return-code ref: https://supreme-gamers.com/gearlock/#install-sh-return-codes)
# #
# # fi


# Backup mesa
if [ ! -f $DEPDIR/mesa.bak ]; then
	geco "\n+ Backing up stock mesa dri & dependencies ..."
	cd /system; garca a -m0=lzma2 -mx=3 '-xr!*arm*' '-xr!*firmware*' '-xr!*modules*' "$DEPDIR"/mesa.bak lib* vendor/lib*
fi

# Cleanup mesa
geco "\n${GREEN}Cleaning up existing mesa dri & dependencies${RC} ..."
nout clean_job; [ "$?" != "0" ] && geco "\n+ Something went wrong, the installation can not continue ..." && return 101

# Merge mesa
geco "\n+ Merging new mesa dri & dependencie files in your operating-system"
gclone "$BD/system" / # You must use quotes " " if any of your file-name contains *spaces or special characters

# Symlink dri
for libX in lib lib64; do
	[ -e /system/$libX/dri ] && [ ! -e /system/vendor/$libX/dri ] && ln -sr /system/$libX/dri /system/vendor/$libX/dri
	[ -e /system/vendor/$libX/dri ] && [ ! -e /system/$libX/dri ] && ln -sr /system/vendor/$libX/dri /system/$libX/dri
done

# Clear dalvik-cache
geco "\n+ Clearing dalvik-cache ..."
[ -d "/data/dalvik-cache" ] && rm -rf /data/dalvik-cache/*

















##### uninstall.sh code ####
## Cut this part into your `uninstall.sh`
# GEN_UNINS should be set to `no` for mesa packages.

# Check if the user is trying to uninstall from gearlock-app
[ ! -z "$(ps | grep $GAPPID)" ] && geco "\n+ You must run ${YELLOW}gearlock${RC} from terminal (tty) to uninstall mesa !\n+ Press ${BRED}Alt + F1${RC}, then type ${YELLOW}gearlock${RC} and press enter." && sleep 10 && gkillapp $GAPPID && chvt 1

# Cleanup
geco "\n+ Cleaning up current mesa deps ..."; sleep 0.5
cd /system; rm -r lib*/hw lib*/egl lib*/dri; rm -r vendor/lib*; nout rm lib*/*

# Extract mesa backup
geco "\n+ Restoring old mesa : \c"
[ ! -f $DEPDIR/mesa.bak ] && geco "\n- Mesa backup archive not found !" && return 101
nout garca x -aoa -o/system $DEPDIR/mesa.bak && rm $DEPDIR/mesa.bak
geco "Done !"; sleep 1.5

# Clear dalvik-cache
geco "\n+ Clearing dalvik-cache ..."
[ -d "/data/dalvik-cache" ] && rm -rf /data/dalvik-cache/*

# GEN_UNINS should be set to `no` for mesa packages.
## Cut this part into your `uninstall.sh`
##### uninstall.sh code ####



## There are many more awesome functions that you can use, visit https://supreme-gamers.com/gearlock for more information.
