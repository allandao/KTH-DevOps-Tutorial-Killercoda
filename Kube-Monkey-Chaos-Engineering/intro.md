<br>

## Introduction

Welcome to a quick intro of kube-monkey, a chaos engineering tool implemented for Kubernetes clusters.

From the repository:

"kube-monkey is an implementation of Netflix's Chaos Monkey for Kubernetes clusters. It randomly deletes Kubernetes (k8s) pods in the cluster encouraging and validating the development of failure-resilient services."

See more: https://github.com/asobti/kube-monkey

## Platform
Killercoda is fantastic platform that lets us easily configure and create an environment where kubectl and helm are already installed, with a Kubernetes environment ready for us.

On the right, you can find a code editor, or tabs which are simply terminal environments.

---- 

kube-monkey runs at a pre-configured hour (run_hour, defaults to 8 am) on weekdays, and builds a schedule of deployments that will face a random Pod death sometime during the same day. The time-range during the day when the random pod Death might occur is configurable and defaults to 10 am to 4 pm.

You are able to change the time kube-monkey wakes up and start and end killing pods.

