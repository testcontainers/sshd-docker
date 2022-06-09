FROM alpine:3.16.0
RUN apk add --no-cache openssh && ssh-keygen -A && echo 'root:root' | chpasswd
