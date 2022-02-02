#!/bin/bash

## Install talosctl
echo "Fetching talosctl..."
echo ""
curl -s -Lo /usr/local/bin/talosctl https://github.com/talos-systems/talos/releases/latest/download/talosctl-$(uname -s | tr "[:upper:]" "[:lower:]")-amd64

chmod +x /usr/local/bin/talosctl

## Install kubectl
echo "Fetching kubectl..."
echo ""
curl -s -Lo /usr/local/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x /usr/local/bin/kubectl
