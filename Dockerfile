FROM alpine:3.19.1
RUN apk add --no-cache openssh && ssh-keygen -A && echo 'root:root' | chpasswd
