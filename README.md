# Toolbox

A relatively small image with commonly used debugging tools:

* `bind-tools`
* `curl`
* `jq`
* `nmap`
* `iputils`
* `net-tools`
* `iperf`
* `tmux`

Default shell is `bash`, with extra aliases and `Ctrl/Option + arrow key` for jumping words. `tmux` is included with a custom config and `Ctrl-a` as a leader key.

# Run

```sh
kubectl run -it --image diversario/toolbox
```
