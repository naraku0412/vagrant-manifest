#!/bin/bash
ansible node -m shell -a "mkdir -p /home/Vm/Vm8"

VMS="/home/Vm/Vm8"

for VM in $VMS; do
 ansible node -m copy -a "src=./vagrant-centos-7.2.box dest=$VM"
done

for VM in $VMS; do
 ansible node -m copy -a "src=./Vagrantfile dest=$VM"
done

host_ip=("166" "168" "169" "170")


VMFILES=$(find /home/Vm -type f -name "Vagrantfile")

for FILE in $VMFILES;do

  ansible "192.168.100."${host_ip[0]} -m shell -a " sed -i '9c INTERFACE = \"ens5\" ' $FILE"

 for ((i=1;i<${#host_ip[@]};i++));do
   ansible "192.168.100."${host_ip[$i]} -m shell -a " sed -i '9c INTERFACE = \"eno1\" '  $FILE"
 done

  echo "192.168.100."${host_ip[0]}

done

for VM in "/home/Vm/Vm8"; do
   ansible node -m shell -a "sed -i '10c IP = \"192.168.100.8\"+i' $VM/Vagrantfile"
   for(( i=0;i<${#host_ip[@]};i++)); do
     k=`expr ${i} + 1`
     ansible "192.168.100."${host_ip[${i}]} -m shell -a "sed -i '8c i = \"${k}\"' $VM/Vagrantfile"
   done
done
