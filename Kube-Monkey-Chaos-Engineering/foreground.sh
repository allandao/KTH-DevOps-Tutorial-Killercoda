echo "Preparing scenario..."
while [ ! -f /tmp/finished ]
kubectl version --client
kubectl cluster-info
# kubectl get deployments
kubectl get namespaces
kubectl get pods # kubectl get pod -A
kubectl get pod -n default  # default namespace contains two pods
echo READY