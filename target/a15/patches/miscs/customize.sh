echo "Disable Vulkan"
SET_PROP "vendor" "ro.hwui.use_vulkan" "false"
SET_PROP "vendor" "debug.hwui.renderer" "skiagl"
SET_PROP "vendor" "debug.renderengine.backend" "skiagl"
SET_PROP "vendor" "renderthread.skia.reduceopstasksplitting" "true"
SET_PROP "vendor" "debug.hwui.skia_atrace_enabled" "false"

echo "Disabling encryption"
# Encryption
LINE=$(sed -n "/^\/dev\/block\/by-name\/userdata/=" "$WORK_DIR/vendor/etc/fstab.mt6789")
sed -i "${LINE}s/,fileencryption=aes-256-xts:aes-256-cts:v2+inlinecrypt_optimized//g" "$WORK_DIR/vendor/etc/fstab.mt6789"

echo "Setting FUSE passthough"
SET_PROP "vendor" "persist.sys.fuse.passthrough.enable" "true"

echo "Disable UFFD GC"
SET_PROP "product" "ro.dalvik.vm.enable_uffd_gc" "false"

echo "Improve WiFi/Mobile Data speeds"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "product" "app/ConnectivityUxOverlay" 0 0 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "product" "app/NetworkStackOverlay" 0 0 755 "u:object_r:system_file:s0"