FROM alpine:3.19.1
RUN apk add --no-cache openssh && ssh-keygen -A && echo 'root:root' | chpasswd

ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D", "-o", "PermitRootLogin=yes", "-o", "AddressFamily=inet", "-o", "GatewayPorts=yes", "-o", "AllowAgentForwarding=yes", "-o", "AllowTcpForwarding=yes", "-o", "KexAlgorithms=+diffie-hellman-group1-sha1", "-o", "HostkeyAlgorithms=+ssh-rsa"]
