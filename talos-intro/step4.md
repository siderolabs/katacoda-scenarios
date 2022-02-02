Now that we understand the `talosconfig`, we have the context necessary to explore `talosctl`.
Because Talos Linux does not have SSH or BASH, it is important to understand the idea of using the API for gaining insight into the system when needed.
In this step, we will go through a small sample of the commands available.

Note that you can always review the [Talos Linux docs](https://www.talos.dev/docs/latest/reference/cli/) for more info about `talosctl` outside of this guide.

## Dashboard

Since we're targeting both nodes in our cluster, a good place to get a snapshot view is to issue `talosctl dashboard`{{execute}}.
This view will show a real-time glance at each node that is targeted.
You can switch between the nodes by simply hitting the left and right arrow keys.
Once you have finished exploring, hit `q` or `Ctrl+C` to exit.

## Logs

For a given node, it may be important to gather logs to see what's going on in the system.
Let's first list the services across our two nodes with `talosctl services`{{execute}}.

With our service list in hand, we can gather logs from any of these.
For example, we can see what the kubelet is up to with a command like `talosctl logs kubelet --nodes 10.5.0.2`{{execute}}.

## Navigating Files

Navigating the filesystem can be done easily with the `list` (or `ls`) and `read` subcommands.
Let's start by listing the static pod manifests on the control plane node.
Issue `talosctl list --nodes 10.5.0.2 /etc/kubernetes/manifests`{{execute}}.

Then, let's print the API server manifest with `talosctl read --nodes 10.5.0.2 /etc/kubernetes/manifests/talos-kube-apiserver.yaml`{{execute}}.

## Disks

As an example of other supported commands, we can list the disks for all nodes by issuing `talosctl disks`{{execute}}.
Additionally, we can list all volume mounts with a command like `talosctl mounts --nodes 10.5.0.3`{{execute}}.
