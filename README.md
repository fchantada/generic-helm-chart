# generic-helm-chart

## Install Helmfile
- https://github.com/helmfile/helmfile/releases

## Install Dependencies
```
helmfile init helmfile.yaml --force
```

## Eexecute helmfile
```
helmfile apply helmfile.yaml -l app=nats
```