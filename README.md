1)
In /etc/dracut.conf:
filesystems+="ceph"

2)
Append to PXE:
root=ceph://name:secret@10.11.23.1:6789,10.11.23.2:6789,10.11.23.3:6789:/centos7/root

