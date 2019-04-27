#!/bin/bash
ansible node -m script -a "./vagrant-destroy.sh"
ansible node -m script -a "./vagrant-up.sh"
