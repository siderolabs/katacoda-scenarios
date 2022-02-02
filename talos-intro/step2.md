With our prerequisites handled, we can now create a Kubernetes clusters using Talos Linux.
This cluster will be hosted completely in Docker containers.

Simply execute `talosctl cluster create --kubernetes-version 1.23.1`{{execute}} to get started.

This will, by default, create a cluster with 1 control plane node and 1 worker.
We will specify the Kubernetes version here as well, so we can go through a Kubernetes upgrade later.
Note that, because of the constrained resources of a Katacoda environment, it may take some time for the cluster to finish creating.
There are several things happening behind the scenes, such as: launching the Talos Linux API, pulling container images, bootstrapping Kubernetes.

Once the cluster creation is complete, you should see some output of the nodes that were created.
This output will look similar to:

```bash
NODES:

NAME                      TYPE           IP         CPU    RAM      DISK
/talos-default-master-1   controlplane   10.5.0.2   2.00   2.1 GB   -
/talos-default-worker-1   worker         10.5.0.3   2.00   2.1 GB   -
```

This process will also create the necessary Kubernetes configuration.
You can validate that Kubernetes is up and running properly with `kubectl get nodes -o wide`{{execute}}.
