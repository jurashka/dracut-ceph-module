Copy content usr/lib/dracut/modules.d to /usr/lib/dracut/modules.d/
<p><b>1) CEPH </b></p>
Install ceph-common<br>
In /etc/dracut.conf add:
<p>filesystems+="ceph"</p>
Append to PXE:
<p>root=ceph://name:secret@10.11.23.1:6789,10.11.23.2:6789,10.11.23.3:6789:/centos7/root</p>

<p><b>2) RBD</b></p>
In /etc/dracut.conf add:
<p>add_drivers+="rbd"</p>
<p>filesystems+="ext4 xfs"</p>
Append to PXE:
<p>root=rbd://name:secret@10.11.23.1:6789,10.11.23.2:6789,10.11.23.3:6789:/POOL/rbd_image</p>

<p><b>3) HTTP</b></p>
In /etc/dracut.conf add:
<p>add_dracutmodules+="http"</p>
Append to PXE:
<p>root=http://10.20.0.2/root/root.tar.gz</p>


