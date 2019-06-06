#!/bin/bash
sed "s,node,$1," /etc/libvirt/qemu/node.xml >/etc/libvirt/qemu/${1}.xml
qemu-img create -f qcow2 -b /var/lib/libvirt/images/node.qcow2 /var/lib/libvirt/images/${1}.img 30G
virsh define /etc/libvirt/qemu/${1}.xml
