#!/bin/bash

set -ex

PLAYBOOK_DIR="$HOME/repos/ansible"
CONFIG_DIR="$HOME/.config/dotfiles"

if ! [[ -x "$(command -v ansible)" ]]; then
  sudo add-apt-repository -y --update ppa:ansible/ansible
  sudo apt install ansible
fi

# if ! [[ -d "$PLAYBOOK_DIR" ]]; then
#   git clone "https://github.com/Hess0r/ansible.git" $PLAYBOOK_DIR
# else
#   git -C "$PLAYBOOK_DIR" pull
# fi

ansible-galaxy install -r "$PLAYBOOK_DIR/requirements.yml"

if [[ -f "$CONFIG_DIR/vault-password.txt" ]]; then
  ansible-playbook --diff --extra-vars "@$CONFIG_DIR/values.yml" --vault-password-file "$CONFIG_DIR/vault-password.txt" "$PLAYBOOK_DIR/main.yml"
else
  ansible-playbook --diff --extra-vars "@$CONFIG_DIR/values.yml" "$PLAYBOOK_DIR/main.yml"
fi
