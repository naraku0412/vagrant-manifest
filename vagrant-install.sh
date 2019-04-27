#!/bin/bash

#安装vagrant
rpm -ivh ../vagrant_2.1.2_x86_64.rpm

#安装virtualbox，并解决依赖
yum -y localinstall ../VirtualBox-5.2-5.2.16_123759_el7-1.x86_64.rpm

#安装gcc
yum -y install gcc

#安装virtualbox内核
yum -y install kernel-devel

#更新宿主机系统内核
yum -y update kernel 

#重新启动宿主机

#reboot
