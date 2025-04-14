echo -e "Start kind";
kind create cluster --name 'meu-cluster' --config 'kind-config.yaml';

echo -e "\nGet nodes and pods";
kubectl get nodes -o wide;
kubectl get pods -o wide;

echo -e "\nInstall ingress-nginx";
kubectl apply -f "ingress-nginx.yaml";
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=300s;

echo -e "\nConfigure ingress";
sleep 5;
kubectl apply -f "ingress-config.yaml";
sleep 10;

echo -e "\nInstall apps";
kubectl apply -f "apps-sample.yaml";