kind create cluster --name 'meu-cluster' --config 'kind-config.yaml';
kubectl get nodes -o wide;
kubectl get pods -o wide;

kubectl apply -f "ingress-nginx.yaml";
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s;

kubectl apply -f "ingress-config.yaml";

kubectl apply -f "apps-sample.yaml";