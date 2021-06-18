#!/bin/bash

# Copy the ansible cfg into place
echo "*** Copying Ansible Config"
[[ -e ~/.ansible.cfg ]] && echo "Backing up old cfg" && cp ~/.ansible.cfg ~/.ansible.cfg.old;
cp ansible.cfg ~/.ansible.cfg;

echo "*** Checking for ansible"
command -v ansible-playbook > /dev/null || { echo "Please install Ansible 2.4 or higher"; exit 1; }
ANS_VER=$(ansible --version | head -n 1)
python check_ans_ver.py "$ANS_VER" || echo "Need Ansible >= 2.4, you have $ANS_VER"

echo "*** Installing community.general collection"
ansible-galaxy collection install community.general

echo "*** Running the playbook"
TAGS=""
[[ -n "$*" ]] && echo "using tags" "$@" && TAGS="-t $*";
CMD="ansible-playbook dotfiles.yml -i ./hosts --vault-id @prompt -v -K ${TAGS}"
[[ -z "$ANSIBLE_COW_SELECTION" ]] && ANSIBLE_NOCOWS=1
echo "${CMD}"
ANSIBLE_NOCOWS=$ANSIBLE_NOCOWS ${CMD}
