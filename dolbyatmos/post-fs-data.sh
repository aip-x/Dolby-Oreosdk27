#!/system/bin/sh


# Dolby Atmos™ environment preparation
# gh


# Mount relevant partitions rw:

mount -o rw,remount /data 2>/dev/null


# Switch SELinux to Permissive Mode if in Enforcing Mode:

(
  selinux=`getenforce`
  if [ "$selinux" == "Enforcing" ]; then
    setenforce 0 2>/dev/null
  fi
)&


# Create database directory for Dolby, if necessary:

(
  if [ ! -d /data/misc/media ]; then
    mkdir -p /data/misc/media
    chmod 0770 /data/misc/media
    chown 1013:1013 /data/misc/media
    chcon u:object_r:media_data_file:s0 /data/misc/media
  fi
)&
