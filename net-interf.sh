#!/bin/bash
host_ip=("166" "168" "169" "170")

VMFILES=$(find /home/Vm -type f -name "Vagrantfile")

for FILE in $VMFILES;do 

  ansible "192.168.100."${host_ip[0]} -m shell -a " sed -i '9c INTERFACE = \"ens5\" ' $FILE"


  echo "192.168.100."${host_ip[0]}

 for ((i=1;i<${#host_ip[@]};i++));do
   ansible "192.168.100."${host_ip[$i]} -m shell -a " sed -i '9c INTERFACE = \"eno1\" '  $FILE"
 done

  echo "192.168.100."${host_ip[0]}

done
