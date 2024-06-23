FROM alpine:3.20.1
RUN apk add --no-cache openssh && ssh-keygen -A

ENV USERNAME="root"
ENV PASSWORD="root"

ENTRYPOINT ["sh", "-c"]
CMD ["echo ${USERNAME}:${PASSWORD} | chpasswd && /usr/sbin/sshd -D -o PermitRootLogin=yes -o AddressFamily=inet -o GatewayPorts=yes -o AllowAgentForwarding=yes -o AllowTcpForwarding=yes -o KexAlgorithms=+diffie-hellman-group1-sha1 -o HostkeyAlgorithms=+ssh-rsa"]
