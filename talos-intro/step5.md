The last important thing to note about Talos Linux is that, since it is tailor made for Kubernetes, we try to make upgrades as painless as possible.

## Upgrading Kubernetes

Kubernetes upgrades are supported right out of the box.
But first, it's always a good idea to take a snapshot of the etcd database before doing maintenance on a cluster.
Let's take a snapshot with `talosctl etcd snapshot --nodes 10.5.0.2 ./snap.db`{{execute}}.
Take note that the node targeted for the snapshot command should be a "control plane" node, as this is where etcd is running.
You can view that the backup was created with `ls -lah .`{{execute}}.

Now we are ready for a Kubernetes upgrade.
You may have noticed earlier that we deployed version `1.23.1` of Kubernetes during cluster creation.
Let's now upgrade to a newer patch release by issuing `talosctl upgrade-k8s --nodes 10.5.0.2 --to 1.23.3`{{execute}}

## Upgrading Talos

Since we're using a docker-based Talos Linux cluster in this scenario, we are unable to upgrade Talos Linux in the way that we recommend.
However, if you are on a "normal" Talos Linux cluster, an upgrade of the OS itself can be orchestrated with a simple command like: `talosctl upgrade --image ghcr.io/talos-systems/installer:v0.14.1 --nodes 10.5.0.3`, updating the node IP and the image version as necessary to deploy the desired version of Talos Linux.
