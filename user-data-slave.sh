#!/bin/bash
#
#==================================================================
# title           : user-data-slave.sh
#
# Description     : Redo partition hadoop Slave node
#
# Author          : Onkarkadam7
#
# usage cli       : bash user-data-slave.sh
#
# usage openstack : provide to --user-data user-data-slave.sh
#==================================================================

# umount /mnt
# sed -i '/^\/dev\/vdb/d' /etc/fstab
# parted --script /dev/vdb \
#   mklabel gpt \
#   mkpart primary 0% 25% \
#   mkpart primary 25% 50% \
#   mkpart primary 50% 75% \
#   mkpart primary 75% 100%
#
# sleep 45
#
# for i in {1..4}
# do
#   mkfs.ext4 /dev/vdb$i
#   echo "/dev/vdb$i              /opt/data0$i                       ext4    defaults        1 1" >> /etc/fstab
#   mkdir -p /opt/data0$i
#   mount /opt/data0$i
# done

echo qwerty | passwd --stdin root
# sed -i '/^PermitRootLogin/d' /etc/ssh/sshd_config
# echo 'PermitRootLogin yes/' >> /etc/ssh/sshd_config
# sed -i '/PasswordAuthentication/s/no/yes/' /etc/ssh/sshd_config
# service sshd restart
