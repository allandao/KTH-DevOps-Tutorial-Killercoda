#!/bin/bash

set -x # to test stderr output in /var/log/killercoda

echo Starting... # to test stdout output in /var/log/killercoda

# Tasks Start -----
# Download kubectl --
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# # Validate the kubectl binary against the checksum file. Output should be kubectl: OK
# echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
# # Install kubectl
# sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# # Install helm --
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# chmod 700 get_helm.sh
# ./get_helm.sh
# Kube-Monkey --
helm repo add kubemonkey https://asobti.github.io/kube-monkey/charts/repo
helm repo update
helm install my-release kubemonkey/kube-monkey --version 1.5.0
# Example k8s deployment
kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost netexec --http-port=8080

touch /tmp/finished