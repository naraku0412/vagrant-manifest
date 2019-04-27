#!/bin/bash
i=1
j=2

echo `expr ${i} + 4`
b=`expr ${i} + ${j}`
echo $b
VMS="/home/Vm/Vm1 /home/Vm/Vm2 /home/Vm/Vm3 /home/Vm/Vm4 /home/Vm/Vm5 /home/Vm/Vm6 /home/Vm/Vm7"
for VM in $VMS; do
 ansible node -m copy -a "src=./Vagrantfile dest=$VM"
done

