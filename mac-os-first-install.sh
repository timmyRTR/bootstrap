#!/bin/bash

#
# see https://github.com/geerlingguy/mac-dev-playbook for customization options
#

readonly GIT_HOME_DIR="$HOME/git"
readonly MAC_PLAYBOOK_GIT_URL="https://github.com/geerlingguy/mac-dev-playbook.git"
readonly GIT_PLAYBOOK_DIR="${GIT_HOME_DIR}/mac-dev-playbook"
# install xcode tools
echo "Installing xcode command line tools..."
xcode-select --install

# python people prefer pip
echo "Installing pip..."
sudo easy_install pip

# get ansible via pip
echo "Installing Ansible..."
sudo pip install ansible

echo "Finding your git directory..."
test -d ${GIT_HOME_DIR} && mkdir -p ${GIT_HOME_DIR} || echo "- git directory exists - "

echo "Cloning geerlingguy's mac-dev-playbook from GitHub..."
git clone ${MAC_PLAYBOOK_GIT_URL} ${GIT_PLAYBOOK_DIR}

echo "Copying Mac specific config file to playbook"
cp ./mac-config.yml ${GIT_PLAYBOOK_DIR}/config.yml

echo "Resolving Ansible dependencies from Ansible Galaxy"
(cd ${GIT_PLAYBOOK_DIR} && ansible-galaxy install -r requirements.yml)

echo "Running main config playbook"
(cd ${GIT_PLAYBOOK_DIR} && ansible-playbook main.yml -i inventory -K)
