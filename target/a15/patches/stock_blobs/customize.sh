echo "Add stock audio policy"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/etc/stage_policy.conf" 0 0 644 "u:object_r:system_file:s0"

echo "Delete Hotword"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentOKGoogleEx4CORTEXM55"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentXGoogleEx4CORTEXM55"

echo "Fix NFC"
BLOBS_LIST="
system/lib64/libnfc_sec_jni.so
system/lib64/libnfc-nci_flags.so
system/lib64/libnfc-sec.so
system/lib64/libstatslog_nfc.so
"
for blob in $BLOBS_LIST
do
DELETE_FROM_WORK_DIR "system" "$blob"
done

BLOBS_LIST="
system/lib64/libnfc_nxpsn_jni.so
system/priv-app/NfcNci/lib/arm64/libnfc_nxpsn_jni.so
system/lib64/vendor.samsung.hardware.nfc@2.0.so
"
for blob in $BLOBS_LIST
do
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "$blob" 0 0 644 "u:object_r:system_lib_file:s0"
done