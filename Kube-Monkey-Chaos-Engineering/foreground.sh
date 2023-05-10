echo "Preparing scenario..."
while [ ! -f /tmp/finished ]; kubectl version --client; 
kubectl cluster-info; kubectl get deployments; kubectl get pods; done
echo READY