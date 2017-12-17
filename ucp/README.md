# Setting Up Universal Control Plane

## Help

* **install**         Install UCP on this node
* **restart**         Start or restart UCP components running on this node
* **stop**            Stop UCP components running on this node
* **upgrade**         Upgrade the UCP cluster
* **images**          Verify the UCP images on this node
* **uninstall-ucp**   Uninstall UCP from this swarm cluster
* **dump-certs**      Print the public certificates used by this UCP web server
* **support**         Create a support dump for this UCP node
* **id**              Print the ID of UCP running on this node
* **backup**          Create a backup of a UCP manager node
* **restore**         Restore a UCP cluster from a backup
* **example-config**  Display an example config file for UCP
* **help**            Shows a list of commands or help for one command

## Install 

Docker Universal Control Plane Tool

   install - Install UCP on this node

USAGE: 
   docker run --rm -it \
        --name ucp \
        -v /var/run/docker.sock:/var/run/docker.sock \
        docker/ucp \
        install [command options]
 
DESCRIPTION:
   
This command initializes a new swarm, turns this node into a manager, and installs
Docker Universal Control Plane (UCP).

When installing UCP you can customize:

  * The certificates used by the UCP web server. Create a volume
    named 'ucp-controller-server-certs' and copy the ca.pem, cert.pem, and key.pem
    files to the root directory. Then run the install command with the
    '--external-server-cert' flag.

  * The license used by UCP, by bind-mounting the file at
    '/config/docker_subscription.lic' in the tool.  E.g. -v /path/to/my/config/docker_subscription.lic:/config/docker_subscription.lic
    or by specifying with '--license "$(cat license.lic)"

If you're joining more nodes to this swarm, open the following ports in your
firewall:

  * 443 or the '--controller-port'
  * 2376 or the '--swarm-port'
  * 2377 or the swarm-mode listen port
  * 12376, 12379, 12380, 12381, 12382, 12383, 12384, 12385, 12386, 12387
  * 4789(udp) and 7946(tcp/udp) for overlay networking

If you have SELinux policies enabled for your Docker install, you will need to
use 'docker run --rm -it --security-opt label=disable ...' when running this
command.


OPTIONS:
   --debug, -D                  Enable debug mode
   --jsonlog                    Produce json formatted output for easier parsing
   --interactive, -i            Run in interactive mode and prompt for configuration values
   --admin-username value       The UCP administrator username [$UCP_ADMIN_USER]
   --admin-password value       The UCP administrator password [$UCP_ADMIN_PASSWORD]
   --san value                  Add subject alternative names to certificates (e.g. --san www1.acme.com --san www2.acme.com) [$UCP_HOSTNAMES]
   --host-address value         The network address to advertise to other nodes. Format: IP address or network interface name [$UCP_HOST_ADDRESS]
   --data-path-addr value       Address or interface to use for data path traffic. Format: IP address or network interface name [$UCP_DATA_PATH_ADDR]
   --controller-port value      Port for the web UI and API (default: 443)
   --swarm-grpc-port value      Port for communication between nodes (default: 2377)
   --dns value                  Set custom DNS servers for the UCP containers [$DNS]
   --dns-opt value              Set DNS options for the UCP containers [$DNS_OPT]
   --dns-search value           Set custom DNS search domains for the UCP containers [$DNS_SEARCH]
   --unlock-key value           The unlock key for this swarm-mode cluster, if one exists. [$UNLOCK_KEY]
   --existing-config            Use an existing UCP config during this installation. The install will fail if a config is not found
   --pull value                 Pull UCP images: 'always', when 'missing', or 'never' (default: "missing")
   --registry-username value    Username to use when pulling images [$REGISTRY_USERNAME]
   --registry-password value    Password to use when pulling images [$REGISTRY_PASSWORD]
   --kv-timeout value           Timeout in milliseconds for the key-value store (default: 5000) [$KV_TIMEOUT]
   --kv-snapshot-count value    Number of changes between key-value store snapshots (default: 20000) [$KV_SNAPSHOT_COUNT]
   --disable-tracking           Disable anonymous tracking and analytics
   --disable-usage              Disable anonymous usage reporting
   --external-server-cert       Customize the certificates used by the UCP web server
   --preserve-certs             Don't generate certificates if they already exist

   --external-service-lb value  Set the IP address of the load balancer that published services are expected to be reachable on
   --enable-profiling           Enable performance profiling
   --license value              Add a license: e.g. --license "$(cat license.lic)" [$UCP_LICENSE]
   --force-insecure-tcp         Force install to continue even with unauthenticated Docker Engine ports.
   
*Backwards Compatibility*

   --swarm-port value           Port for the Docker Swarm manager. Used for backwards compatibility (default: 2376)
   --swarm-experimental         Enable Docker Swarm experimental features. Used for backwards compatibility
   --binpack                    Set the Docker Swarm scheduler to binpack mode. Used for backwards compatibility
   --random                     Set the Docker Swarm scheduler to random mode. Used for backwards compatibility
