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

helm install test kubemonkey/kube-monkey \
               --set config.dryRun=true \
               --set config.runHour=2.75 \
               --set config.startHour=3 \
               --set config.endHour=3.03 \
               --set config.timeZone=Europe/Stockholm

0.03333 = 2/60
kube-monkey runs at a pre-configured hour (run_hour, defaults to 8 am) on weekdays, and builds a schedule of deployments that will face a random Pod death sometime during the same day. The time-range during the day when the random pod Death might occur is configurable and defaults to 10 am to 4 pm.

config.timeZone 	time zone in DZ format
 	Europe/Stockholm
 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

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
