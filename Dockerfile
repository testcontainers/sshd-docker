FROM alpine:3.19.1
# Disable ipv6 & Make it listen on all interfaces, not just localhost
# Enable algorithms supported by our ssh client library
RUN apk add --no-cache openssh && ssh-keygen -A \
    && echo 'root:root' | chpasswd && \
    /usr/sbin/sshd -D -o PermitRootLogin=yes -o AddressFamily=inet \
    -o GatewayPorts=yes -o AllowAgentForwarding=yes -o AllowTcpForwarding=yes \
    -o KexAlgorithms=+diffie-hellman-group1-sha1 -o HostkeyAlgorithms=+ssh-rsa
