#!/system/bin/sh

mkdir /data || true

if mount -o ro /dev/block/bootdevice/by-name/userdata /data; then
    # Mounts successfully
    if [ -d '/data/media/0/Android' ]; then
        # Unencrypted
        cat /system/etc/recovery.fstab.unencrypted >> /system/etc/recovery.fstab
        cat /system/etc/twrp.flags.unencrypted >> /system/etc/twrp.flags
    else
        # FBE
        cat /system/etc/recovery.fstab.fbe >> /system/etc/recovery.fstab
        cat /system/etc/twrp.flags.fbe >> /system/etc/twrp.flags
    fi
    umount /data || true
else
    # Fails to mount, is FDE
    cat /system/etc/recovery.fstab.fde >> /system/etc/recovery.fstab
    cat /system/etc/twrp.flags.fde >> /system/etc/twrp.flags
fi