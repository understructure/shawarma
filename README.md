
# Shawarma

Resources for Docker Swarm

## Docker Swarm Cheat Sheet

General commands / options:

* `docker swarm` - join a swarm, leave a swarm, update the swarm, rotate certificates, manage snapshots and task history
* `docker node`
* `--help` - you can always ask for help


### Docker Swarm

`docker swarm COMMAND`

* **ca** - Manage root CA
  * --ca-cert
  * --ca-key
  * --cert-expiry
  * --detach
  * --external-ca
  * --quiet
  * --rotate
* **init** - Initialize a swarm
  * --advertise-addr <ip_interface>:<port_number>
  * --autolock
  * --cert-expiry
  * --data-path-addr
  * --dispatcher-heartbeat
  * --external-ca
  * --force-new-cluster
  * --listen-addr
  * --max-snapshots
  * --snapshot-interval
  * --task-history-limit
* **join** - Join a swarm as a node and/or manager
  * --advertise-addr <ip_interface>:<port_number>
  * --availability
  * --data-path-addr
  * --listen-addr
  * --token
* **join-token**  - Manage join tokens for worker or manager
  * --quiet
  * --rotate
* **leave** - Leave the swarm
  * --force
* **unlock**  - Unlock swarm (no options)
* **unlock-key** - Manage the unlock key
  * --rotate
* **update** - Update the swarm
  * --autolock
  * --cert-expiry
  * --dispatcher-heartbeat
  * --external-ca
  * --max-snapshots
  * --snapshot-interval
  * --task-history-limit

### Docker Node

`docker node COMMAND`

 * **demote** - Demote one or more nodes from manager in the swarm (no options)
 * **inspect** - Display detailed information on one or more nodes
   * --format
   * --pretty
 * **ls** - List nodes in the swarm
   * --filter
   * --format
   * --quiet
 * **promote** - Promote one or more nodes to manager in the swarm (no options)
 * **ps** - List tasks running on one or more nodes, defaults to current node
   * --filter
   * --format
   * --no-resolve
   * --no-trunc
   * --quiet
 * **rm** - Remove one or more nodes from the swarm
   * --force
 * **update** - Update a node
   * --availability
   * --label-add
   * --label-rm
   * --role


