#!/bin/sh

. /lib/rbd-lib.sh

[ "$#" = 3 ] || exit 1

# root is in the form root=ceph://user:pass@server:/pool/rbd either from
# cmdline or dhcp root-path
netif="$1"
root="$2"
NEWROOT="$3"

modprobe rbd 2>/dev/null

rbd_to_var $root
echo server: $server
echo options: $options
echo rbd: $pool/$name

# Attempt to map the rbd device.
# Linux 4.15 defaulted single_major to true in torvalds/linux@3cfa3b1, 
# which means you should use /sys/bus/rbd/add_single_major now. 
# You can revert to the old behavior with e.g. modprobe rbd single_major=0.
echo "$server $options $pool $name" > /sys/bus/rbd/add_single_major

mount /dev/rbd0 $NEWROOT -o noatime,nodiratime && { [ -e /dev/root ] || ln -s null /dev/root ; }

# inject new exit_if_exists
echo 'settle_exit_if_exists="--exit-if-exists=/dev/root"; rm -f -- "$job"' > $hookdir/initqueue/ceph.sh
# force udevsettle to break
> $hookdir/initqueue/work

