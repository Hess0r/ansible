#!/bin/bash

set -ex

code --install-extension dbaeumer.vscode-eslint \
  eamodio.gitlens \
  esbenp.prettier-vscode \
  golang.go \
  mhutchie.git-graph \
  ms-azuretools.vscode-docker \
  ms-vscode-remote.remote-containers \
  PKief.material-icon-theme \
  sleistner.vscode-fileutils \
  vscodevim.vim \
  Gruntfuggly.todo-tree \
  zhuangtongfa.material-theme \
  onecentlin.laravel-blade \
  shufo.vscode-blade-formatter \
  bmewburn.vscode-intelephense-client \
  bradlc.vscode-tailwindcss \
  formulahendry.auto-close-tag \
  formulahendry.auto-rename-tag \
  mikestead.dotenv \
  csstools.postcss \
  EditorConfig.EditorConfig \
  redhat.vscode-xml \
  yzhang.markdown-all-in-one \
  streetsidesoftware.code-spell-checker

cp ./roles/vscode/files/settings.json /mnt/c/Users/sgabor/AppData/Roaming/Code/User/settings.json
cp ./roles/vscode/files/keybindings.json /mnt/c/Users/sgabor/AppData/Roaming/Code/User/keybindings.json