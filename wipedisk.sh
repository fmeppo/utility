#!/bin/sh
#
# wipedisk.sh <drive>
#
# Wipes all partitions from the given block device.

DEV=$1

if [ -z $DEV ]; then
    echo "Must supply a block device!"
    exit 1
else
    echo -n "Wiping $DEV...."
    /usr/sbin/sgdisk -Z $DEV
    echo "done."
fi
