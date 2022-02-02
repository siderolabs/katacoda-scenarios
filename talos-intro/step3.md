With your cluster up and running, you can now start to learn about what makes Talos Linux so special: the API.
As previously mentioned, `talosctl` is a CLI that allows for interaction with this API on one or many Talos Linux nodes.
The underpinning of this is the `talosconfig` file.
Let's view it with `cat ~/.talos/config`{{execute}}.

This file contains all of the information necessary for `talosctl` to communicate with your Talos Linux nodes.
Of important note is the `endpoints` key.
Endpoints are nodes that are directly routable from where the `talosctl` client will be run.
These endpoints will then act as a "router" for connections to nodes that may not have routable IPs from the client side.
Generally, endpoints are Talos Linux control plane nodes.
In this example, we only have a single endpoint, but others can be added by issuing a command like:

```bash
talosctl config endpoint <control-plane-ip-1> <control-plane-ip-2> <control-plane-ip-3>
```

Doing so will allow `talosctl` to do client-side loadbalancing of requests.

Another field that is of note is `nodes`.
This field is not present in the default `talosconfig` file, as it is assumed the user will either specify nodes manually or update this file as needed.
`Nodes` are the Talos Linux nodes that will be targeted for a given `talosctl` command.

Let's first see that you can target nodes directly by issuing `talosctl version --nodes 10.5.0.3`{{execute}}.
Note that you can also use a `-n` shorthand for this command.
This command will be sent to the endpoint (our single control plane node), then routed based on the node flag.
In this case, it will be forwarded to the Talos Linux API on the single worker node we created.

Let's now update the `talosconfig` to target both of our nodes by default by issuing `talosctl config nodes 10.5.0.2 10.5.0.3`{{execute}}.

Finally, you can validate that the endpoints were edited with `cat ~/.talos/config`{{execute}}.
