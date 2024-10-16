# sshd-docker
Docker image with SSH daemon installed

# Usage
This container is meant to be used to expose host ports to containers running in Docker.
When using testcontainers in unit tests, refer to the documentation of testcontainers to find out how to use it:
- Java: https://java.testcontainers.org/features/networking/#exposing-host-ports-to-the-container
- .NET: https://dotnet.testcontainers.org/api/create_docker_network/#exposing-host-ports-to-the-container
- node.js: https://node.testcontainers.org/features/networking/#expose-host-ports-to-container

Alternatively, you can start the container yourself:
```yaml
services:
  sshd:
    image: testcontainers/sshd:1.2.0
    environment:
      PASSWORD: "SET_YOUR_PASSWORD_HERE"
    ports:
      - 10022:22

  requester:
    image: curlimages/curl
    command: /bin/sh -c "while true; do curl http://sshd:8080; sleep 5; done"
    depends_on:
      - sshd
```

And connect to it via ssh:

```bash
# ssh -R [remote_port]:[destination_address]:[local_port] [username]@[ssh_server]
ssh -R 8080:localhost:8080 root@localhost:10022
```

Start your application and you should see requests coming from the requester service:

```bash
python3 -m http.server 8080
```
