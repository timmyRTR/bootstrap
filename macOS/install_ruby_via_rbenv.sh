#!/bin/bash

ansible-galaxy --force install zzet.rbenv
ansible-playbook -i inventory -c local ruby.yml -K
