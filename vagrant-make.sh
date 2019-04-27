#!/bin/bash
:<<!
 ansible node -m shell -a "mkdir -p /home/Vm/Vm1"
 ansible node -m shell -a "mkdir -p /home/Vm/Vm2"
 ansible node -m shell -a "mkdir -p /home/Vm/Vm3"
 ansible node -m shell -a "mkdir -p /home/Vm/Vm4"
 ansible node -m shell -a "mkdir -p /home/Vm/Vm5"
 ansible node -m shell -a "mkdir -p /home/Vm/Vm6"
 ansible node -m shell -a "mkdir -p /home/Vm/Vm7"
!
VMS="/home/Vm/Vm1 /home/Vm/Vm2 /home/Vm/Vm3 /home/Vm/Vm4 /home/Vm/Vm5 /home/Vm/Vm6 /home/Vm/Vm7"
:<<!
for VM in $VMS; do
 ansible node -m copy -a "src=./vagrant-centos-7.2.box dest=$VM"
done

for VM in $VMS; do
 ansible node -m copy -a "src=./Vagrantfile dest=$VM"
done
!
host_ip=("166" "168" "169" "170")


VMFILES=$(find /home/Vm -type f -name "Vagrantfile")

for FILE in $VMFILES;do

  ansible "192.168.100."${host_ip[0]} -m shell -a " sed -i '9c INTERFACE = \"ens5\" ' $FILE"

 for ((i=1;i<${#host_ip[@]};i++));do
   ansible "192.168.100."${host_ip[$i]} -m shell -a " sed -i '9c INTERFACE = \"eno1\" '  $FILE"
 done

  echo "192.168.100."${host_ip[0]}

done


for VM in "/home/Vm/Vm1"; do
   ansible node -m shell -a "sed -i '10c IP = \"192.168.100.1\"+i' $VM/Vagrantfile"
   for(( i=0;i<${#host_ip[@]};i++)); do
     k=`expr ${i} + 1`
     ansible "192.168.100."${host_ip[${i}]} -m shell -a "sed -i '8c i = \"${k}\"' $VM/Vagrantfile"
   done
done


for VM in "/home/Vm/Vm2"; do
   ansible node -m shell -a "sed -i '10c IP = \"192.168.100.2\"+i' $VM/Vagrantfile"
   for(( i=0;i<${#host_ip[@]};i++)); do
     k=`expr ${i} + 1`
     ansible "192.168.100."${host_ip[${i}]} -m shell -a "sed -i '8c i = \"${k}\"' $VM/Vagrantfile"
   done
done

for VM in "/home/Vm/Vm3"; do
   ansible node -m shell -a "sed -i '10c IP = \"192.168.100.3\"+i' $VM/Vagrantfile"
   for(( i=0;i<${#host_ip[@]};i++)); do
     k=`expr ${i} + 1`
     ansible "192.168.100."${host_ip[${i}]} -m shell -a "sed -i '8c i = \"${k}\"' $VM/Vagrantfile"
   done
done

for VM in "/home/Vm/Vm4"; do
   ansible node -m shell -a "sed -i '10c IP = \"192.168.100.4\"+i' $VM/Vagrantfile"
   for(( i=0;i<${#host_ip[@]};i++)); do
     k=`expr ${i} + 1`
     ansible "192.168.100."${host_ip[${i}]} -m shell -a "sed -i '8c i = \"${k}\"' $VM/Vagrantfile"
   done
done

for VM in "/home/Vm/Vm5"; do
   ansible node -m shell -a "sed -i '10c IP = \"192.168.100.5\"+i' $VM/Vagrantfile"
   for(( i=0;i<${#host_ip[@]};i++)); do
     k=`expr ${i} + 1`
     ansible "192.168.100."${host_ip[${i}]} -m shell -a "sed -i '8c i = \"${k}\"' $VM/Vagrantfile"
   done
done

for VM in "/home/Vm/Vm6"; do
   ansible node -m shell -a "sed -i '10c IP = \"192.168.100.6\"+i' $VM/Vagrantfile"
   for(( i=0;i<${#host_ip[@]};i++)); do
     k=`expr ${i} + 1`
     ansible "192.168.100."${host_ip[${i}]} -m shell -a "sed -i '8c i = \"${k}\"' $VM/Vagrantfile"
   done
done

for VM in "/home/Vm/Vm7"; do
   ansible node -m shell -a "sed -i '10c IP = \"192.168.100.7\"+i' $VM/Vagrantfile"
   for(( i=0;i<${#host_ip[@]};i++)); do
     k=`expr ${i} + 1`
     ansible "192.168.100."${host_ip[${i}]} -m shell -a "sed -i '8c i = \"${k}\"' $VM/Vagrantfile"
   done
done
