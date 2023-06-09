#!/bin/sh

# Install zsh if not installed
if ! [ -x "$(command -v zsh)" ]; then
  echo 'Error: zsh is not installed.' >&2
  apt install zsh
fi
# Install oh-my-zsh if no .oh-my-zsh folder in home directory
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo 'Error: oh-my-zsh is not installed.' >&2
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install kubectl
# make .local/bin if not exist
echo "Installing kubectl"
if [ ! -d "$HOME/.local/bin" ]; then
  mkdir -p $HOME/.local/bin
fi

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod a+x kubectl
mv kubectl .local/bin/kubectl
echo "kubectl installed to .local/bin/kubectl"