Write-Host "Start kind" -ForegroundColor Blue;
kind create cluster --name 'meu-cluster' --config 'kind-config.yaml';

Write-host "`nGet nodes and pods" -ForegroundColor Blue;
kubectl get nodes -o wide;
kubectl get pods -o wide;

Write-host "`nInstall ingress-nginx" -ForegroundColor Blue;
kubectl apply -f "ingress-nginx.yaml";
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=300s;

Write-host "`nConfigure ingress" -ForegroundColor Blue;
kubectl apply -f "ingress-config.yaml";
Start-Sleep 10;

Write-host "`nInstall apps" -ForegroundColor Blue;
kubectl apply -f "apps-sample.yaml";