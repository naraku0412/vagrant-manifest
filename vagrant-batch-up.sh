#!/bin/bash

CMD=$1

if [ -z "$CMD" ]; then
  CMD="vagrant up"
fi


#161

#VMS="/home/Vm/Vm1 /home/Vm/Vm2 /home/Vm/Vm3 /home/Vm/Vm4 /home/Vm/Vm5 /home/Vm/Vm6 /home/Vm/Vm7"

VMS="/home/Vm/Vm8"
for  VM in $VMS; do
     ansible node -m shell -a "cd $VM && $CMD"
done


