# Kind

## Help

- [Kubernetes com Kind: O guia definitivo](https://youtu.be/Fq-F63QfIVw)

## Install kind on windows

```ps1
winget install --id Kubernetes.kind;
```

## Kind commands

```ps1
kind create cluster --name 'meu-cluster' --config 'kind-config.yaml';
```

```ps1
kind delete cluster --name 'meu-cluster';
```

## [Ingress](https://kind.sigs.k8s.io/docs/user/ingress/)

```bash
# apply nginx ingress
kubectl apply -f "ingress-nginx.yaml";
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s;
```

## Ingress Config

```bash
# apply
kubectl apply -f "ingress-config.yaml";
# delete
kubectl delete -f "ingress-config.yaml";
```

## Nginx app

```bash
# apply
kubectl apply -f "apps-sample.yaml";
# delete
kubectl delete -f "apps-sample.yaml";
```
