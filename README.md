# docker-wireguard

## Requirement

- net_admin cap

        --cap-add net_admin

## Suggestions

- IPv6 Support:

        --sysctl net.ipv6.conf.all.disable_ipv6=0
        --sysctl net.ipv6.conf.all.forwarding=1

- No Tun Device:

        -v /dev/net/tun:/dev/net/tun
