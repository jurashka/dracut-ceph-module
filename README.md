1)
In /etc/dracut.conf add:
<p>add_drivers+="rbd"</p>
<p>filesystems+="ceph ext4 xfs"</p>

2)
Append to PXE:
<p>root=ceph://name:secret@10.11.23.1:6789,10.11.23.2:6789,10.11.23.3:6789:/centos7/root</p>
or
<p>root=rbd://name:secret@10.11.23.1:6789,10.11.23.2:6789,10.11.23.3:6789:/POOL/rbd_image</p>

