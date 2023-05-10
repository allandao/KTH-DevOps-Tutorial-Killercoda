<br>

## Introduction

Welcome to a demo on kube-monkey, a chaos engineering tool implemented for Kubernetes clusters.

From the repository:

"kube-monkey is an implementation of Netflix's Chaos Monkey for Kubernetes clusters. It randomly deletes Kubernetes (k8s) pods in the cluster encouraging and validating the development of failure-resilient services."

https://github.com/asobti/kube-monkey

## Demo
We are using killercoda to easily configure and create an environment where kubectl and kube-monkey are already downloaded and installed and where a Kubernetes environment is ready.

Automated Steps
1. Install kubectl
2. Install helm (dependency for kube-monkey)
. Install kube-monkey
. Configure k8s environment

If you want to change the time kube-monkey wakes up and start and end killing pods.

helm install hello-node kubemonkey --set config.dryRun=false

---- 

k get pod -A
kubectl get pod -A

helm install kube-system kubemonkey \
               --set config.dryRun=true \
               --set config.runHour=21 \
               --set config.startHour=21 \
               --set config.endHour=21.05

helm repo update
helm show all kubemonkey

----

`helm install --name hello-node kubemonkey \
               --set config.dryRun=false \
               --set config.whitelistedNamespaces="{namespace1,namespace2,namespace3}"
               --set config.runHour=21 \
               --set config.startHour=21 \
               --set config.endHour=21.05`
               {{exec}}

If you want to enable attack notifications.
`helm install --name hello-node kubemonkey \
               --set config.dryRun=false \
               --set config.whitelistedNamespaces="namespace1\"\,\"namespace2\"\,\"namespace3" \
               --set config.notifications.enabled=true \
               --set config.notifications.endpoint=http://localhost:8080/path \
               --set config.notifications.message="{\"foo\":\"bar\"}" \
               --set config.notifications.headers="Content-Type:application/json\"\,\"client-id:kubemonkey"`{{exec}}
