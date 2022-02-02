Before we can create a Talos Linux cluster, we must download `talosctl`.
`talosctl` is a command line tool that enables communication from the client to one or more Talos Linux nodes.
A bash script called `prereqs.sh` has been uploaded to the environment.
This script will automatically download `talosctl` and `kubectl`.

Let's execute that by issuing `/root/prereqs.sh`{{execute}}.

Finally, validate that `talosctl` and `kubectl` are present in `ls -lah /usr/local/bin`{{execute}}.

Note that `talosctl` can always be downloaded from the Talos Linux [Github release page](https://github.com/talos-systems/talos/releases).
Linux, Mac, and Windows builds of `talosctl` are present in the "Assets" section there.
