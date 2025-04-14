Write-Host "Start kind";
kind create cluster --name 'meu-cluster' --config 'kind-config.yaml';

Write-host "Get nodes and pods";
kubectl get nodes -o wide;
kubectl get pods -o wide;

Write-host "Install ingress-nginx";
kubectl apply -f "ingress-nginx.yaml";
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s;

Write-host "Configure ingress";
kubectl apply -f "ingress-config.yaml";

Write-host "Install apps";
kubectl apply -f "apps-sample.yaml";