# generic-helm-chart

The objective of this repo is to deploy a custom k8s manifest from a generic Helm chart.
Currently, we're supporting the following kinds:
- ClusterRole & ClusterRoleBinding
- Deployment or StatefullSet
- HorizontalPodAutoscaler
- Ingress
- PodDisruptionBudget
- PersistentVolumeClaim
- Role & RoleBinding
- Secret
- ServiceAccount
- Service

## How to use it, using Helmfile
### Install Helmfile
- https://github.com/helmfile/helmfile/releases

### Install Dependencies
```
helmfile init helmfile.yaml --force
```

### Eexecute helmfile
```
helmfile apply helmfile.yaml -l app=example-app
```