#!/bin/bash
ansible node -m shell -a "mkdir -p /home/Vm/Vm1"
ansible node -m shell -a "mkdir -p /home/Vm/Vm2"
ansible node -m shell -a "mkdir -p /home/Vm/Vm3"
ansible node -m shell -a "mkdir -p /home/Vm/Vm4"
ansible node -m shell -a "mkdir -p /home/Vm/Vm5"
ansible node -m shell -a "mkdir -p /home/Vm/Vm6"
ansible node -m shell -a "mkdir -p /home/Vm/Vm7"

VMS="/home/Vm/Vm1 /home/Vm/Vm2 /home/Vm/Vm3 /home/Vm/Vm4 /home/Vm/Vm5 /home/Vm/Vm6 /home/Vm/Vm7"

for VM in $VMS; do
echo $VM
ansible node -m copy -a "src= ./vagrant-centos-7.2.box dest=$VM"
done

for VM in $VMS; do
ansible node -m copy -a "src= ./Vagrantfile dest=$VM"
done


