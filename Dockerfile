FROM alpine:3.5
RUN apk add --no-cache openssh && ssh-keygen -A && echo 'root:root' | chpasswd
