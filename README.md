1)
In /etc/dracut.conf add:
add_drivers+="rbd"
filesystems+="ceph ext4 xfs"

2)
Append to PXE:
root=ceph://name:secret@10.11.23.1:6789,10.11.23.2:6789,10.11.23.3:6789:/centos7/root
or
root=ceph://name:secret@10.11.23.1:6789,10.11.23.2:6789,10.11.23.3:6789:/POOL/rbd_image

